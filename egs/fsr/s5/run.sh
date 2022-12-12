. ./utils/parse_options.sh
. ./cmd.sh
. ./path.sh
. ./utils/parse_options.sh

nj=1
cmd=$train_cmd
logdir=./log

name=`basename`
scp=data/train/wav.scp

$cmd JOB=1:$nj $logdir/make_mfcc_${name}.JOB.log \
    extract-segments scp,p:$scp $logdir/segments.JOB ark:-