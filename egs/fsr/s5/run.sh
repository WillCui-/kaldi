. ./utils/parse_options.sh
. ./cmd.sh
. ./path.sh

nj=1
cmd=$train_cmd
logdir=./log

$cmd JOB=1:$nj $logdir/test.JOB.log \
  mel-computations 