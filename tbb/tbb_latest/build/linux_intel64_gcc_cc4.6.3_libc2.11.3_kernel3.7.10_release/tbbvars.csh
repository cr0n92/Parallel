#!/bin/csh
setenv TBBROOT "/home/users/nikela/tbb/tbb44_20151010oss" #
setenv tbb_bin "/home/users/nikela/tbb/tbb44_20151010oss/build/linux_intel64_gcc_cc4.6.3_libc2.11.3_kernel3.7.10_release" #
if (! $?CPATH) then #
    setenv CPATH "${TBBROOT}/include" #
else #
    setenv CPATH "${TBBROOT}/include:$CPATH" #
endif #
if (! $?LIBRARY_PATH) then #
    setenv LIBRARY_PATH "${tbb_bin}" #
else #
    setenv LIBRARY_PATH "${tbb_bin}:$LIBRARY_PATH" #
endif #
if (! $?LD_LIBRARY_PATH) then #
    setenv LD_LIBRARY_PATH "${tbb_bin}" #
else #
    setenv LD_LIBRARY_PATH "${tbb_bin}:$LD_LIBRARY_PATH" #
endif #
 #
