class Clock {
  constructor(hours, minutes, seconds) {
    // 1. Create a Date object.
    // 2. Store the hours, minutes, and seconds.
    // 3. Call printTime.
    // 4. Schedule the tick at 1 second intervals.
    // const that = this
    this.hours = Date().split(" ")[4].split(":")[0];
    this.minutes = Date().split(" ")[4].split(":")[1];
    this.seconds = Date().split(" ")[4].split(":")[2];
    setInterval(this._tick.bind(this), 1000);
    this.printTime();
  }

  printTime() {
    // Format the time in HH:MM:SS
    // Use console.log to print it.
    console.log(`${this.hours}:${this.minutes}:${this.seconds}`)
  }

  _tick() {
    // 1. Increment the time by one second.
    // 2. Call printTime.
    this.seconds ++;
    if (this.seconds === 60) {
      this.seconds = '00';
      this.minutes ++;
    }
    if (this.minutes === 60) {
      this.minutes = '00';
      this.hours ++;
    }
    if (this.hours === 24) {
      this.hours = '00';
    }
    this.printTime();
  }
}

const clock = new Clock();