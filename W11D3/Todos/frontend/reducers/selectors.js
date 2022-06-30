import React from 'react'

export const allTodos = (state) => {
    const toDoArr = Object.values(state.todos)
    return toDoArr;
}


