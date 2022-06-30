import React from 'react'


const TodoListItem = (props) => {
    let toggleText;
    function toggleDone(e){
        e.preventDefault();
        props.todo.done = !props.todo.done
        props.receiveTodo(props)
    }
    if(props.todo.done){ toggleText = "undo"} else {toggleText = "done"}
    return (
        <div>
            <h3>{props.todo.title}</h3>
            <p>{props.todo.body}</p>
            <p>{props.todo.done}</p>
            <button onClick={toggleDone}>{toggleText}</button>
        </div>
    )

}

// export default TodoListItem;
// const TodoListItem = todo.title;
// console.log("this is a todolistitem")

export default TodoListItem;