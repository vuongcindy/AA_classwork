import React from 'react'
import TodoListContainer from './todos/todo_list_container'
import { useState } from 'react';

const App = () => {
    const initialText = 'Done';
    const [buttonText, setButtonText] = useState(initialText);

    function handleClick(){
        setButtonText('Undo');
    }
    
    return (
        <div>
            <h2>Todo App</h2>
            <TodoListContainer />
        </div>
    )
}

export default App;