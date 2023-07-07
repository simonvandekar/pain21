#' Loads 21 pain studies
#'
#' Cleaned data from 21 pain studies used by Maumet et al. (2016) and downloaded from Neurovault.org at http://neurovault.org/collections/1425/.
#'
#' Gorgolewski KJ, Varoquaux G, Rivera G, Schwartz Y, Ghosh SS, Maumet C, Sochat VV, Nichols TE, Poldrack RA, Poline J-B, Yarkoni T and Margulies DS (2015) NeuroVault.org: a web-based repository for collecting and sharing unthresholded statistical maps of the brain. Front. Neuroinform. 9:8. doi: 10.3389/fninf.2015.00008
#' Maumet, Camille, Tibor Auer, Alexander Bowring, Gang Chen, Samir Das, Guillaume Flandin, Satrajit Ghosh, et al. “Sharing Brain Mapping Statistical Results with the Neuroimaging Data Model.” Scientific Data 3 (December 6, 2016). https://doi.org/10.1038/sdata.2016.102.
#'
#' @keywords 21 pain studies
#' @export
#' @importFrom utils read.table
#' @examples
#' pain21()
pain21 = function(){
  pain21dir = file.path(find.package('pain21'), 'pain21')
  mask = list.files(pain21dir, 'mask.nii.gz', full.names=TRUE)
  template = list.files(pain21dir, 'MNI152_T1_2mm_brain.nii.gz', full.names=TRUE)
  out = read.table(file.path(pain21dir, 'samplesize.csv'), header=FALSE, col.names=c('study', 'n', 'spm'), strip.white=TRUE, sep=',')
  out$images=list.files(pain21dir, 'contrast_pain_[0-9]*.nii.gz', full.names=TRUE)
  out$varimages=list.files(pain21dir, 'var_pain_[0-9]*.nii.gz', full.names=TRUE)
  return(list(data=out, mask=mask, template=template))
}
