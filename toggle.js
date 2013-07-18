// Toggle Display of BibTeX
function toggleAbs(articleid) {
	var bib = document.getElementById('bib_'+articleid);
	if (bib) {
		bib.className.indexOf('noshow') == -1?bib.className = 'noshow':bib.className = 'show';
	} else { 
		return;
	}
}
