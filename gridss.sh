#!/bin/sh
#___INFO__MARK_BEGIN__
# Welcome to use  EasyCluster V1.6 All Rights Reserved.
#
#___INFO__MARK_END__
#
#$ -S /bin/sh
#$ -N SKall
#$ -j y
#$ -o ./
#$ -e ./
#$ -cwd
#$ -q serial.q,normal.q,hm256.q,hm512.q
#$ -pe thread 8

source ~/.bash_profile
hash -r

pop=SK
midfileDIR=/pdiskdata/zhenyinggroupADS/huangruoshi/my_cluster/my_silkie_midfiles

REFDIR=/pdiskdata/zhenyinggroupADS/huangruoshi/wgsdata/chicken_ref

ref_genome=$REFDIR/Gallus_gallus.GRCg6a.dna.toplevel.fa
ref_bwa=$REFDIR/RefSeq
dbsnp=$REFDIR/newdbSNP.vcf.gz
repeatmasker=$REFDIR/rep.ref.bed

gridss=/usr/local/gridss2.9.4/gridss.sh
gridssjar=/usr/local/gridss2.9.4/gridss-2.9.4-gridss-jar-with-dependencies.jar

parentDir=/pdiskdata/zhenyinggroupADS/huangruoshi/wgsdata
#midfileDIR=$parentDir/$pop/midfiles


$gridss --threads 8 -j $gridssjar --reference $ref_genome --output ./output_SK \
--assembly Clean_01 --assembly Clean_02 --assembly Clean_03 --assembly Clean_04 --assembly Clean_05 --assembly Clean_06 --assembly Clean_07 --assembly Clean_08 --assembly Clean_09 --assembly Clean_ns \
--repeatmaskerbed $repeatmasker $midfileDIR/recaled_Clean_01.bam $midfileDIR/recaled_Clean_02.bam $midfileDIR/recaled_Clean_03.bam $midfileDIR/recaled_Clean_04.bam $midfileDIR/recaled_Clean_05.bam $midfileDIR/recaled_Clean_06.bam $midfileDIR/recaled_Clean_07.bam $midfileDIR/recaled_Clean_08.bam $midfileDIR/recaled_Clean_09.bam $midfileDIR/recaled_Clean_ns.bam \



