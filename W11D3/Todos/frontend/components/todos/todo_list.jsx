import React from 'react'
import TodoListItem from '../todo_list/todo_list_item'
import TodoForm from '../todo_list/todo_form'
import App from '../app'

const TodoList = (props) => {


    
    return (
        <div>
            <h1>Todo List</h1>
            <ul>
                {props.todos.map((todo) => {
                        return(
                            <li key={todo.id}>
                                <TodoListItem receiveTodo={props.receiveTodo} todo={todo}/>
                                <button onClick={()=> {props.removeTodo(todo.id)}} >Remove</button>
                                
                                
                            </li>
                        )
                    })
                }
            </ul>
            <TodoForm receiveTodo={props.receiveTodo}/>
        </div>
    )
}
export default TodoList;