import React from 'react';

class Tabs extends React.Component{
    constructor(props){
        super(props)
        this.state = {selectedTab: 0}
    }

    // changeTab(event) {
    //     this.setState({ selectedTab: 1})
    // }

    render(){
        return(
            <div>
                <h1>Tabs</h1>
                <ul>
                    {this.props.nothobbies[0].pickles} <br />
                    {this.props.nothobbies[1].deep_water} <br />
                    {this.props.nothobbies[2].lance_stroll}
                </ul>
            </div>

        )
    }
}

export default Tabs;