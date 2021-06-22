const checkbox = 
document.getElementById('checkbox');
checkbox.addEventListener('change', ()
=>{ //change the theme of the website here
	document.darkmode.classList.toggle('dark');
});