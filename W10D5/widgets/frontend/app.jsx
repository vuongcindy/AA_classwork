import React from 'react';
import Clock from './clock';
import Tabs from './tabs'

class App extends React.Component {
    render() {
        const thenothobbies = [
            {pickles: "squish"},
            {deep_water: "deep"},
            {lance_stroll: "rick stroll"}
        ]
        return (
            <div>
                <Clock />
                <Tabs nothobbies={thenothobbies}/>
            </div>
        )
    }
}

export default App;