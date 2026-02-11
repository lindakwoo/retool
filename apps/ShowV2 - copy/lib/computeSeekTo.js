let livestreamStartTime = moment.utc(queryLivestream.data.start_time);
let orderCreatedAt = moment.utc(queryRecord.data.created_at);
let seekToSeconds = Math.floor(orderCreatedAt.diff(livestreamStartTime, 'seconds'));

let hours = Math.floor(seekToSeconds / 3600);
let minutes = Math.floor((seekToSeconds % 3600) / 60);
let seconds = seekToSeconds % 60;

hours = (hours < 10) ? "0" + hours : hours;
minutes = (minutes < 10) ? "0" + minutes : minutes;
seconds = (seconds < 10) ? "0" + seconds : seconds;

// Combine the hours, minutes, and seconds
let seekToParam = hours + ":" + minutes + ":" + seconds;
return seekToParam
