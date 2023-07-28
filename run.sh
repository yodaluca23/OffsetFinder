#!/bin/bash
wget https://raw.githubusercontent.com/tihmstar/libpatchfinder/master/example/offsetexporter/template_dynamic_info.h -O template_dynamic_info.h
clear
echo -e "OffsetFinder v0.1 - made by c22dev\nCredits : AppInstallerIOS, tihmstar"
read -p "Enter the IPSW URL: " IPSWURL
read -p "Enter your device Identifier (e.g. iPhone11,8): " Identifier
read -p "Enter the IPSW Version (e.g 16.1): " Version
read -p "Enter the IPSW Build ID (e.g. 20B79): " BuildID
if [[ "$Identifier" =~ "iPhone".* || "$Identifier" =~ "iPad".* ]]; then            KernelCacheName=$(pzb -l --nosubdirs "$IPSWURL" | grep kernelcache.release | sed 's/^.*kernelcache/kernelcache/')
    pzb -g "$KernelCacheName" "$IPSWURL" > /dev/null
    python3 -m pyimg4 im4p extract -i "$KernelCacheName" -o "$Identifier".raw
    rm "$KernelCacheName"
    offsetexporter  -i "$Identifier".raw \
        -t template_dynamic_info.h \
        -o "$Identifier $Version $BuildID.h" \
        --get_kernel_version_string %kern_version% \
        --find_struct_offset_for_PACed_member %fileglob__fg_ops% fileglob.fg_ops \
        --find_struct_offset_for_PACed_member %fileglob__fg_vn_data% fileglob.fg_vn_data \
        --static %fileops__fo_kqfilter% 0x30 \
        --static %fileproc_guard__fpg_guard% 0x8 \
        --static %kqworkloop__kqwl_state% 0x10 \
        --static %kqworkloop__kqwl_p% 0x18 \
        --find_struct_kqworkloop_offset_kqwl_owner %kqworkloop__kqwl_owner% \
        --find_elementsize_for_zone %kqworkloop__object_size% "kqueue workloop zone" \
        --static %pmap__tte% 0x0 \
        --static %pmap__ttep% 0x8 \
        --static %proc__p_list__le_next% 0x0 \
        --static %proc__p_list__le_prev% 0x8 \
        --static %proc__p_pid% 0x60 \
        --find_struct_offset_for_PACed_member %proc__p_fd__fd_ofiles% filedesc.fd_ofiles \
        --find_sizeof_struct_proc %proc__object_size% \
        --static %pseminfo__psem_usecount% 0x04 \
        --static %pseminfo__psem_uid% 0x0c \
        --static %pseminfo__psem_gid% 0x10 \
        --static %pseminfo__psem_name% 0x14 \
        --static %pseminfo__psem_semobject% 0x38 \
        --static %semaphore__owner% 0x28 \
        --static %specinfo__si_rdev% 0x18 \
        --find_struct_offset_for_PACed_member %task__map% task.map \
        --find_struct_task_offset_thread_count %task__thread_count% \
        --find_struct_offset_for_PACed_member %task__itk_space% task.itk_space \
        --find_sizeof_struct_task %task__object_size% \
        --find_struct_thread_offset_map %thread__map% \
        --find_struct_thread_offset_thread_id %thread__thread_id% \
        --find_sizeof_struct_thread %thread__object_size% \
        --find_sizeof_struct_uthread %uthread__object_size% \
        --static %vm_map_entry__links__prev%  0x00 \
        --static %vm_map_entry__links__next%  0x08 \
        --static %vm_map_entry__links__start% 0x10 \
        --static %vm_map_entry__links__end%   0x18 \
        --static %vm_map_entry__store__entry__rbe_left%   0x20 \
        --static %vm_map_entry__store__entry__rbe_right%  0x28 \
        --static %vm_map_entry__store__entry__rbe_parent% 0x30 \
        --find_struct_offset_for_PACed_member %vnode__v_un__vu_specinfo% vnode.vu_specinfo \
        --find_struct_offset_for_PACed_member %_vm_map__pmap% _vm_map.pmap \
        --static %_vm_map__hdr__nentries% 0x30 \
        --static %_vm_map__hdr__rb_head_store__rbh_root% 0x38 \
        --find_struct__vm_map_offset_vmu1_lowest_unnestable_start %_vm_map__vmu1_lowest_unnestable_start% \
        --find_sizeof_struct__vm_map %_vm_map__object_size% \
        --find_base %kernelcache__kernel_base% \
        --find_cdevsw %kernelcache__cdevsw% \
        --find_gPhysBase %kernelcache__gPhysBase% \
        --find_gVirtBase %kernelcache__gVirtBase% \
        --find_perfmon_devices %kernelcache__perfmon_devices% \
        --find_bof_with_sting_ref %kernelcache__perfmon_dev_open% "perfmon: attempt to open unsupported source" 0 \
        --find_ptov_table %kernelcache__ptov_table% \
        --find_vm_first_phys_ppnum %kernelcache__vm_first_phys_ppnum% \
        --find_vm_pages %kernelcache__vm_pages% \
        --find_vm_page_array_beginning_addr %kernelcache__vm_page_array_beginning_addr% \
        --find_vm_page_array_ending_addr %kernelcache__vm_page_array_ending_addr% \
        --find_function_vn_kqfilter %kernelcache__vn_kqfilter% \
        rm "$Identifier".raw
fi

rm template_dynamic_info.h