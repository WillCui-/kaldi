#!/bin/bash
cd /Users/wcui/Documents/2022Fall/FSR/kaldi/egs/fsr/s5
. ./path.sh
( echo '#' Running on `hostname`
  echo '#' Started at `date`
  echo -n '# '; cat <<EOF
mel-computations 
EOF
) >./log/test.$SGE_TASK_ID.log
time1=`date +"%s"`
 ( mel-computations  ) 2>>./log/test.$SGE_TASK_ID.log >>./log/test.$SGE_TASK_ID.log
ret=$?
time2=`date +"%s"`
echo '#' Accounting: time=$(($time2-$time1)) threads=1 >>./log/test.$SGE_TASK_ID.log
echo '#' Finished at `date` with status $ret >>./log/test.$SGE_TASK_ID.log
[ $ret -eq 137 ] && exit 100;
touch ./q/sync/done.13411.$SGE_TASK_ID
exit $[$ret ? 1 : 0]
## submitted with:
# qsub -v PATH -cwd -S /bin/bash -j y -l arch=*64* -o ./q/test.log  -l mem_free=2G,ram_free=2G  -t 1:1 /Users/wcui/Documents/2022Fall/FSR/kaldi/egs/fsr/s5/./q/test.sh >>./q/test.log 2>&1
