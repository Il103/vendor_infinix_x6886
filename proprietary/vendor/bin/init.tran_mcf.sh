#!/vendor/bin/sh
#
# Copyright (C) 2023 Transsion Inc
# @Author: MCF team: shaopu.luan and xuan.zhang5
# @Date: 06/21/2023 TDD:add by shaopu.luan: Optimize tran_mcf script
#        07/07/2023 TDD:add by Xuan.Zhang5: add MCF Carrier Config OTA feature
#

VERSION="V1.0.0"
mcf_runtime_dir="/mnt/vendor/nvcfg/mdota"
mcf_buildtime_dir="/vendor/etc/mdota"
tran_ota_dir="/tranfs/MTK_OTA/"
tran_ota_mcf_dir_gen95="mcf_gen95"
tran_ota_mcf_dir_gen97="mcf_gen97"
tran_ota_mcf_dir_gen98="mcf_gen98"
tran_ota_mcf_dir_gen99="mcf_gen99"
tran_ota_mcf_dir=""
tranfs_dir="/tranfs"
tranfs_sim_status_0=""
tranfs_sim_status_1=""
tranfs_platform_support=$2

dsbp_running_time=""
dsbp_running_start=""
dsbp_running_end=""

TRAN_MTK_PLATFORM_GEN95="LR13"
TRAN_MTK_PLATFORM_GEN97="NR15"
TRAN_MTK_PLATFORM_GEN98="NR16"
TRAN_MTK_PLATFORM_GEN99="NR17"

PROPERTY_SIM_STATUS_0="$(echo -e $1|sed 's/\,/ /g'|awk '{print $1}')"
PROPERTY_SIM_STATUS_1="$(echo -e $1|sed 's/\,/ /g'|awk '{print $2}')"
PROPERTY_MCF_SUPPORT="ro.vendor.mtk_mcf_support"
PROPERTY_PLATFORM_SUPPORT="ro.vendor.mediatek.platform"

#set log print style
#function LOG_TAG() {
#echo -e "[`date +%Y/%m/%d\ %H:%M:%S`]  `whoami` "
#}

#exit script 
function _exit(){
if [ $1 -eq 0 ] ; then
        echo -e "TRAN MCF update result:Successed     "
        echo -e "------------------------------------------------------------------------    "
        echo -e "                                                                            "
        cp -f ${mcf_runtime_dir}/tran_mcf.log $tranfs_dir
        chmod -R 644 "${tranfs_dir}"/tran_mcf.log
        exit 0
else
        echo -e "TRAN MCF update result:Failed     "
        echo -e "------------------------------------------------------------------------    "
        echo -e "                                                                            "
        cp -f ${mcf_runtime_dir}/tran_mcf.log $tranfs_dir
        chmod -R 644 "${tranfs_dir}"/tran_mcf.log
        exit 1
fi
}
#move to runtime path 
function move_to_runtime_dir() {
#cheek runtime_dir
echo -e "Get ota_file_num = $1"
# ota file num > 0
if [ $1 -gt 0 ] ; then
        #check runtime path size 
        runtime_dir_size=$(du -ms ${mcf_runtime_dir}|awk '{print $1}')
        echo -e "Get Runtime dir size = ${runtime_dir_size}MB"
        if [ ${runtime_dir_size} -lt 10 ] ; then
                echo -e "Runtime_dir_size check PASS"
                # move new mcfota files and change proper permission
                if [ $2 -gt 0 ] ; then
                    cp -pf "${tran_ota_mcf_dir}"/*.mcfota "${mcf_runtime_dir}"
                    if [ $? -ne 0 ] ; then
                        echo -e "Move MCF_OTA file failed"
                        _exit 1
                    fi
                    chmod -R 644 "${mcf_runtime_dir}"/*.mcfota
                    if [ $? -ne 0 ] ; then
                        echo -e "No permission to control MCF_OTA files"
                        _exit 1
                    fi
                fi
                if [ $3 -gt 0 ] ; then
                    cp -pf "${tran_ota_mcf_dir}"/*.mcfopota "${mcf_runtime_dir}"
                    if [ $? -ne 0 ] ; then
                        echo -e "Move MCF_OPOTA file failed"
                        _exit 1
                    fi
                    chmod -R 644 "${mcf_runtime_dir}"/*.mcfopota
                    if [ $? -ne 0 ] ; then
                        echo -e "No permission to control MCF_OPOTA files"
                        _exit 1
                    fi
                fi
                if [ $4 -gt 0 ] ; then
                    cp -pf "${tran_ota_mcf_dir}"/*.mcfnwota "${mcf_runtime_dir}"
                    if [ $? -ne 0 ] ; then
                        echo -e "Move MCF_NWOTA file failed"
                        _exit 1
                    fi
                    chmod -R 644 "${mcf_runtime_dir}"/*.mcfnwota
                    if [ $? -ne 0 ] ; then
                        echo -e "No permission to control MCF_NWOTA files"
                        _exit 1
                    fi
                fi
        else
                echo -e "Runtime_dir_size must be less than 10MB"
                _exit 1
        fi
else
        echo -e "OTA Files not find ,Please check the number of OTA files "
        _exit 1

fi
}

function  check_mcf_result(){
case $2 in
        0)
                mcf_result=" READ FILE SUCCESS"
                ;;
        1)
                mcf_result=" NOT SUPPORT "
                ;;
        2)
                mcf_result=" VERSION NOT MATCH "
                ;;
        3)
                mcf_result=" WRONG BUFFER SIZE "
                ;;
        4)
                mcf_result=" INVALID PARAMETER "
                ;;
        5)
                mcf_result=" READ NVRAM FAIL "
                ;;
        6)
                mcf_result=" WRITE NVRAM FAIL "
                ;;
        7)
                mcf_result=" READ OTA FILE FAIL "
                ;;
        8)
                mcf_result=" INVALID SBP TAG "
                ;;
        9)
                mcf_result=" INVALID FILE  "
                ;;
        10)
                mcf_result=" INVALID ATTR "
                ;;
        11)
                mcf_result=" TAKE READ LOCK FAIL "
                ;;
        12)
                mcf_result=" ALLOCATE BUFFER FAIL "
                ;;
        13)
                mcf_result=" ENCRYPTION FAIL "
                ;;
        14)
                mcf_result=" DECRYPTION FAIL "
                ;;
        15)
                mcf_result=" CHECKSUM ERROR "
                ;;
        16)
                mcf_result=" WRITE DISK FAIL "
                ;;
        17)
                mcf_result=" READ INI FILE FAIL"
                ;;
        18)
                mcf_result=" INVALID INI ITEM"
                ;;
        19)
                mcf_result=" WRITE INI FILE FAIL "
                ;;
        20)
                mcf_result=" FILE NOT CHANGE "
                ;;
        21)
                mcf_result=" DIGEST FAIL "
                ;;
        50)
                mcf_result=" DSBP FAIL "
                ;;
        51)
                mcf_result=" FAIL MCF DSBP ONGOING "
                ;;
        52)
                mcf_result=" FAIL MAX"
                ;;
        *)
                mcf_result=" FAIL BY OTHER"
                ;;
esac

if [ $1 -eq 2 ] ; then
        echo -e "DSBP Result:${mcf_result}"	
elif [ $1 -eq 6 ] ; then 
        echo -e "MCF Result:${mcf_result}"	
fi
}


function check_auto_mode_dsbp_at_respond() {
i=1
while [ $i -le 3 ]
do
        sleep 3
        if [ -s ${mcf_runtime_dir}/MTK_READ_WRITE_RESULT.txt ] ; then 
                #get dsbp result
                dsbp_mcf_at_respond=`grep -i "EMCFRPT" ${mcf_runtime_dir}/MTK_READ_WRITE_RESULT.txt`
                #echo -e "< +${dsbp_mcf_at_respond}"
                if [ $dsbp_mcf_at_respond ] ; then 
                        dsbp_type_result=$(echo -e ${dsbp_mcf_at_respond#*=}|sed 's/\,/ /g'|awk '{print $1}')
                        dsbp_at_result=$(echo -e ${dsbp_mcf_at_respond#*=}|sed 's/\,/ /g'|awk '{print $2}')
                        dsbp_running_end=`date "+%Y-%m-%d %H:%M:%S"`
                        echo -e "DSBP Complete Time :$dsbp_running_end"
                        dsbp_running_time=$(($(date +%s -d "${dsbp_running_end}")-$(date +%s -d "${dsbp_running_start}")));
                        echo -e "DSBP Running time : ${dsbp_running_time}s"
                        #CHECK MCF_DUMP_RESULT_OF_AUTO_SELECT_BIN
                        if [ $dsbp_type_result -eq 2 ] ; then
                                check_mcf_result $dsbp_type_result $dsbp_at_result
                                if [ $dsbp_at_result -ne 0 ] ; then
                                        _exit 1
                                fi
                        fi
                        break
                else
                        echo -e "Waitting for DSBP respond"
                fi
        else
                echo -e "MTK_READ_WRITE_RESULT.txt not find"
        fi
        let i++
done
}
#check the mcf_at respond
function check_auto_mode_mcf_at_respond() {
i=1
while [ $i -le 3 ]
do
        sleep 1
        if [ -s ${mcf_runtime_dir}/MTK_READ_WRITE_RESULT.txt ] ; then 
                #get mcf result
                mcf_at_respond=$(grep -i "EMCFC" ${mcf_runtime_dir}/MTK_READ_WRITE_RESULT.txt)
                #echo -e "< +${mcf_at_respond}"
                #not null 
                if [ $mcf_at_respond ] ; then 
                        mcf_config_at_result=$(echo -e ${mcf_at_respond#*=}|sed 's/\,/ /g'|awk '{print $1}')
                        mcf_at_result=$(echo -e ${mcf_at_respond#*=}|sed 's/\,/ /g'|awk '{print $2}')
                        dsbp_processing_at_result=$(echo -e ${mcf_at_respond#*=}|sed 's/\,/ /g'|awk '{print $3}')
                        if [ $mcf_config_at_result -eq 6 ] ; then 
                                check_mcf_result $mcf_config_at_result $mcf_at_result
                                case $dsbp_processing_at_result in 
                                        0)
                                                dsbp_processing_result="DSBP TRIGGER SUCCESS"
                                                ;;
                                        1)
                                                dsbp_processing_result="DSBP FAIL MCF DSBP ONGOING"
                                                ;;
                                        2)
                                                dsbp_processing_result="DSBP FAIL SIM SWITCH ONGOING"
                                                ;;
                                        3)
                                                dsbp_processing_result="DSBP FAIL ONGOING CALL OR ECBM "
                                                ;;
                                        4)
                                                dsbp_processing_result="DSBP FAIL NO SIM"
                                                ;;
                                        5)
                                                dsbp_processing_result="DSBP FAIL NOT MODE2"
                                                ;;
                                        6)
                                                dsbp_processing_result="DSBP FAIL SIM ERROR"
                                                ;;
                                        7)
                                                dsbp_processing_result="DSBP FAIL UNKNOWN"
                                                ;;
                                        8)
                                                dsbp_processing_result="DSBP FAIL MAX DATA RETRY TIME"
                                                ;;
                                        *)
                                                dsbp_processing_result="DSBP FAIL BY OTHER"
                                                ;;
                                esac

                                echo -e "${dsbp_processing_result}"
                                if [  ${dsbp_processing_at_result} -eq 0 ] ; then
                                        dsbp_running_start=`date "+%Y-%m-%d %H:%M:%S"`
                                        echo -e "DSBP Trigger Time :$dsbp_running_start"
                                else
                                        if [ $1 != "${tran_ota_mcf_dir}/MTK_OTA.mcfota" ] ; then
                                            _exit 1
                                        fi
                                fi
                                break
                        else 
                                echo -e "Waitting for MCF respond"
                        fi
                fi
        else
                echo -e "MTK_READ_WRITE_RESULT.txt not find"
        fi
        let i++
done
}

function get_carrier_mcf_at_respond() {

i=1
while [ $i -le 3 ]
do
        sleep 1 
        if [ -s ${mcf_runtime_dir}/TRAN_MCF_READ_CONFIG_FILE_PATH_RESULT.txt ] ; then 
                read carrier_mcf_at_respond <${mcf_runtime_dir}/TRAN_MCF_READ_CONFIG_FILE_PATH_RESULT.txt
                if [ $carrier_mcf_at_respond ] ; then
                        #echo -e "< +${carrier_mcf_at_respond}"
                        config_op_cnf=$(echo -e ${carrier_mcf_at_respond#*=}|sed 's/\,/ /g'|awk '{print $1}')
                        config_type_cnf=$(echo -e ${carrier_mcf_at_respond#*=}|sed 's/\,/ /g'|awk '{print $2}')
                        config_path_type_cnf=$(echo -e ${carrier_mcf_at_respond#*=}|sed 's/\,/ /g'|awk '{print $3}')
                        config_file_name_cnf=$(echo -e ${carrier_mcf_at_respond#*=}|sed 's/\,/ /g'|awk '{print $4}')

                        #Get File Path Command
                        if [ $config_op_cnf -eq 4 ] ; then 
                                #MCF file path type  0:buildtime  1:runtime
                                if [ $config_path_type_cnf -eq 0 ] ; then
                                        config_path_type="Buildtime"
                                        generated_time=$(stat ${mcf_buildtime_dir}/$config_file_name_cnf|grep Modify|awk '{print $2 " " $3}') 

                                elif [ $config_path_type_cnf -eq 1 ] ; then
                                        config_path_type="Runtime"
                                        generated_time=$(stat ${mcf_runtime_dir}/$config_file_name_cnf|grep Modify|awk '{print $2 " " $3}') 
                                fi
                        fi
                        echo -e "Loading:
					 Source:$config_path_type \t
					 MCF file:${config_file_name_cnf} \t
					 Compile time: $generated_time \t"
                        break
                else
                        echo -e "Waitting for carrier mcf config respond......"
                fi
        else
                echo -e "TRAN_MCF_READ_CONFIG_FILE_PATH_RESULT.txt  not find"
        fi
        let i++
done
}

function get_carrier_relative_file() {
#MTK_OTA_BIN
echo -e "Get MTK_OTA_BIN"
echo -e at+emcfc=4,0\\r > /dev/pts/7
get_carrier_mcf_at_respond

#GENERAL_BIN
echo -e "Get GENERAL_BIN"
echo -e at+emcfc=4,2\\r > /dev/pts/7
get_carrier_mcf_at_respond

#sim 1 CARRIER_BIN
if [ $tranfs_sim_status_0 == "1" ] ; then 
        echo -e "Get PS1 CARRIER_BIN"
        echo -e at+emcfc=4,1\\r > /dev/pts/7
        get_carrier_mcf_at_respond
fi

#sim 2 CARRIER_BIN
if [ $tranfs_sim_status_1 == "1" ] ; then 
        echo -e "Get PS2 CARRIER_BIN "
        echo -e at+emcfc=4,1\\r > /dev/pts/21
        #check respond
        get_carrier_mcf_at_respond
fi
}

function set_auto_select_mode() {

# reset mcf to auto select mode
if [ $1 -gt 0 ] ; then
    if [ $2 -eq 0 ] ; then
        if echo -e $5|grep -iq "MTK_OPOTA_GENERAL.mcfopota" ; then
            #GENERAL_BIN
            echo -e "reset GENERAL_BIN to auto select mode"
            echo -e at+emcfc=6,2,1,\"\",0\\r > /dev/pts/7
        fi
        if echo -e $5|grep -iq "MTK_OPOTA_SBPID" ; then
            #CARRIER_BIN
            echo -e "reset GENERAL_BIN to auto select mode"
            echo -e at+emcfc=6,1,1,\"\",0\\r > /dev/pts/7
        fi
    else
        if [ $4 -gt 0 ] ; then
            if echo -e $5|grep -iq "MTK_OPOTA_GENERAL.mcfopota" ; then
                #GENERAL_BIN
                echo -e "reset GENERAL_BIN to auto select mode"
                echo -e at+emcfc=6,2,1,\"\",0\\r > /dev/pts/7
            fi
            if echo -e $5|grep -iq "MTK_OPOTA_SBPID" ; then
                #CARRIER_BIN
                echo -e "reset GENERAL_BIN to auto select mode"
                echo -e at+emcfc=6,1,1,\"\",0\\r > /dev/pts/7
            fi
        fi
        #OTA_BIN
        echo -e "reset OTA to auto select mode"
        echo -e at+emcfc=6,0,1,\"\",0\\r > /dev/pts/7
    fi

    #check at respond
    check_auto_mode_mcf_at_respond
    #check_auto_mode_dsbp_at_respond
    #reset modem
    setprop vendor.ril.mux.report.case 2
    setprop vendor.ril.muxreport 1
    #setprop vendor.tran_mcf 8
    sleep 10
fi
}

#update mcf file 
function update_mcf() {
    update_mcf_for_platform() {
        local platform=$1
        local tran_ota_mcf_dir_var=$2

        echo -e "####    Step 2:UPDATE MCF FILE FORM OTA     ####"
        echo -e "MCF Update of the $platform start "
        tran_ota_mcf_dir="${tran_ota_dir}${tran_ota_mcf_dir_var}"

        # Use find instead of ls for better handling of filenames with spaces
        ota_mcfota_files=( $(find "${tran_ota_mcf_dir}" -name "*.mcfota" 2>/dev/null) )
        ota_mcfopota_files=( $(find "${tran_ota_mcf_dir}" -name "*.mcfopota" 2>/dev/null) )
        ota_mcfnwota_files=( $(find "${tran_ota_mcf_dir}" -name "*.mcfnwota" 2>/dev/null) )

        ota_mcfota_file_num=${#ota_mcfota_files[@]}
        ota_mcfopota_file_num=${#ota_mcfopota_files[@]}
        ota_mcfnwota_file_num=${#ota_mcfnwota_files[@]}
        ota_file_num=$((ota_mcfota_file_num + ota_mcfopota_file_num + ota_mcfnwota_file_num))
        ota_files=("${ota_mcfopota_files[@]}" "${ota_mcfota_files[@]}" "${ota_mcfnwota_files[@]}")
        echo ${ota_files}

        move_to_runtime_dir "${ota_file_num}" "${ota_mcfota_file_num}" "${ota_mcfopota_file_num}" "${ota_mcfnwota_file_num}"

        # Additional steps for specific platforms
        if [ "$platform" = "GEN97" ]; then
            echo -e "####    Step 3:CHECK SIM STATUS       #### "
            check_sim_card_status "${ota_mcfota_file_num}"

            echo -e "####    Step 4:SET AUTO SELECT MODE TO MD   ####"
            set_auto_select_mode "${ota_file_num}" "${ota_mcfota_file_num}" "${ota_mcfota_files}" "${ota_mcfopota_file_num}" "${ota_mcfopota_files}"

            echo -e "####    Step 5:GET RELATIVE BIN FROM MD   ####"
            get_carrier_relative_file
        fi
    }

    if echo -e "${tranfs_platform_support}" | grep -iq "${TRAN_MTK_PLATFORM_GEN95}" ; then
        update_mcf_for_platform "GEN95" "${tran_ota_mcf_dir_gen95}"
    elif echo -e "${tranfs_platform_support}" | grep -iq "${TRAN_MTK_PLATFORM_GEN97}" ; then
        update_mcf_for_platform "GEN97" "${tran_ota_mcf_dir_gen97}"
    elif echo -e "${tranfs_platform_support}" | grep -iq "${TRAN_MTK_PLATFORM_GEN98}" ; then
        update_mcf_for_platform "GEN98" "${tran_ota_mcf_dir_gen98}"
    elif echo -e "${tranfs_platform_support}" | grep -iq "${TRAN_MTK_PLATFORM_GEN99}" ; then
        update_mcf_for_platform "GEN99" "${tran_ota_mcf_dir_gen99}"
    else
        echo -e "MCF OTA Not support other platforms \n"
        _exit 1 
    fi
}

function check_log_size (){
if [ -f ${mcf_runtime_dir}/tran_mcf.log ] ; then
        log_size=$(du -m ${mcf_runtime_dir}/tran_mcf.log|awk '{print $1}')
       echo -e "tran_mcf.log size = ${log_size}MB"
       if [ ${log_size} -gt 10 ] ; then 
               echo -e "tran_mcf.log size too large,clearing the log......"
               cat /dev/null >${mcf_runtime_dir}/tran_mcf.log
       fi
       echo -e "tran_mcf.log size checked PASS"
else
        echo -e "Warning! tran_mcf.log file not exsit "
fi
}

function check_sim_card_status(){
echo -e "SIM1 STATUS:$PROPERTY_SIM_STATUS_0 , SIM2 STATUS:$PROPERTY_SIM_STATUS_1"

#status from @iccCardExist
case $PROPERTY_SIM_STATUS_0 in
        "PIN_REQUIRED"|"PUK_REQUIRED"|"NETWORK_LOCKED"|"LOADED"|"READY"|"NOT_READY"|"PERM_DISABLED"|"CARD_IO_ERROR"|"CARD_RESTRICTED")
                tranfs_sim_status_0="1"
                ;;
        *)
                tranfs_sim_status_0="0"
                ;;
esac

#transform sim 2 status
case $PROPERTY_SIM_STATUS_1 in
        "PIN_REQUIRED"|"PUK_REQUIRED"|"NETWORK_LOCKED"|"LOADED"|"READY"|"NOT_READY"|"PERM_DISABLED"|"CARD_IO_ERROR"|"CARD_RESTRICTED")
                tranfs_sim_status_1="1"
                ;;
        *)
                tranfs_sim_status_1="0"
                ;;
esac

echo -e "Convert SIM1 STATUS:$tranfs_sim_status_0 , SIM2 STATUS:$tranfs_sim_status_1"

if [ $1 -eq 1 ] ; then
        echo -e "Update MTK_OTA file"
elif [ $tranfs_sim_status_0 == "0" ] && [ $tranfs_sim_status_1 == "0" ] ;then 
        echo -e "Please check your sim card was inserted"
        _exit 1
fi

echo -e "SIM Status checked PASS"
}

function main() {
# get platform mcf support
MCF_SUPPORT=$(getprop $PROPERTY_MCF_SUPPORT)

echo -e "------------------------------------------------------------------------    "
echo -e "Current Time:[`date +%Y/%m/%d\ %H:%M:%S`]   \t   VERSION: $VERSION"
echo -e "TRAN MCF Process is Running                  "

echo -e "####    Step 1:CHECK LOG FILE SIZE    #### "
check_log_size
#check mcf support
if [ "$MCF_SUPPORT" == "1" ]; then
        update_mcf 
        _exit 0
else 
        echo -e "Device Not support MCF feature!!! \n"
        _exit 1 
fi
}

main |tee -a ${mcf_runtime_dir}/tran_mcf.log 2>&1

