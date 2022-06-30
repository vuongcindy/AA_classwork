import React from 'react'
import ReactDOM from 'react-dom'
import configureStore from "./store/store"
import Root from "./components/root"
import {allTodos} from "./reducers/selectors"
import {receiveTodo} from "./actions/todo_actions"

document.addEventListener("DOMContentLoaded", () => {
    const root = document.getElementById("root");
    const store = configureStore();
    window.store = store;
    window.allTodos = allTodos;
    window.receiveTodo = receiveTodo;
    // debugger;
    ReactDOM.render(<Root store={store}/>, root);
});