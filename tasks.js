// tasks.js


alert('Welcome to the Task Side. Start making plans for today!');

let timer, seconds = 0, targetTime = 0;


//This is where the TIMER section begins----->

function startTimer(duration) {
    targetTime = duration * 60; //convert mins -> secs
    timer = setInterval(updateTime, 1000) //will constantly update timer
}

function pauseTimer() {
    clearInterval(timer) //will stop update timer
}

function resetTimer() {
    clearInterval(timer) ; //will stop update timer
    seconds = 0 ; //actually reset timer
    updateTimer(); //makes it display reset timer
}

function  updateTimer() 
    if (seconds < targetTime) {
	seconds++;
	const remainingSeconds = targetTime - seconds;
	const minutes = Math,floor(remainingSeconds / 60);
	const remainingSecondsDisplay = remainingSeconds % 60;
	document.getElementbyId('timer').innerText = '00:00';
    } else {
	clearInterval(timer);
	document.getElementById('timer').innerText = '00:00';
    }
}

function formatTime(time) {
    return time < 10 ? '0${time}' : time;
}




}
