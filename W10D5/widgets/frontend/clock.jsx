import React from "react";

class Clock extends React.Component {
    constructor() {
        super()
        this.state = { time: new Date() }
        this.tick = this.tick.bind(this);
    }

    tick() {
        this.setState({ time: new Date() })
    }

    componentDidMount() {
        this.timeInterval = setInterval(() => {
            this.tick()
        }, 1000)
    }

    componentWillUnmount() {

    }

    render() {
        let hours = String(this.state.time.getHours()).padStart(2, '0');
        let minutes = String(this.state.time.getMinutes()).padStart(2, '0');
        let seconds = String(this.state.time.getSeconds()).padStart(2, '0');
        // let date = this.state.time.toString();
        let date = this.state.time.toDateString();
        return (
            <div>
                <h1>Clock Title</h1>
                <div id="timeAndDate">
                    <p>
                        <span>Time:</span>
                        <span>{ `${hours}:${minutes}:${seconds}` } PDT</span>
                    </p>
                    <p>
                        <span>Date:</span>
                        <span>{`${date}`}</span>
                    </p>
                </div>
            </div>
        )
    }
}


export default Clock;

// ${hours} ${minutes} ${seconds}