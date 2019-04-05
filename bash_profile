# add location alias
alias home="cd /home/jwillou/"
alias shansen="cd /scratch/hansen/j/jwillou/"
alias sconte="cd /scratch/conte/j/jwillou/"
alias scarter="cd /scratch/carter/j/jwillou"
alias scratch="cd /scratch/snyder/j/jwillou/"
alias qq="qstat -n -u jwillou"
alias q="qstat -u jwillou"
alias sq="showq -u jwillou"
alias depot="cd /depot/christ99/users/jwillou"
alias qc="qstat darwin"
alias lien="cd /scratch/snyder/j/jwillou/salmon_poolseq/bwa_mem/lien/"
alias ll="ls -l -h"
alias da="qsub -q darwin -l nodes=1:ppn=1,walltime=8:00:00,naccesspolicy=singleuser -I -v DISPLAY"
alias st="qsub -q standby -l nodes=1:ppn=1,walltime=4:00:00,naccesspolicy=singleuser -I -v DISPLAY"
alias be="qsub -q beagle -l nodes=1:ppn=1,walltime=8:00:00,naccesspolicy=singleuser -I -v DISPLAY"
alias qd="qstat -n darwin"
alias qb="qstat -n beagle"
alias oscratch="cd /scratch/snyder-old/j/jwillou/"
alias mi="cd /scratch/snyder/j/jwillou/salmon_poolseq/michigan/"

# add server to line
export PS1='\[\033[1;30m\]\h[\W]\$\[\033[0m\] '

# set up standard and bioinformatics modules
module use /apps/group/bioinformatics/modules
#module load perl
#module load java

# rmstar, which prevents accidental deletion of all files, is not available for bash.  The following defines
# a function with the same behavior, i.e., it will ask if you want to delete all files before doing it.
rmstar() 
{   for i 
    do 
        if [ "$i" = '*' ] ;then 
            echo -n "Remove all files? Are you sure [y/n]? " 
            read j 
            if [ "$j" != y ] ;then continue ;fi 
        fi 
        set +o noglob 
        eval command rm $i 
        set -o noglob 
    done 
    set +o noglob 
}
alias rm='set -o noglob ; rmstar'
