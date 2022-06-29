export const RECEIVE_TODOS = "RECEIVE_TODOS";
export const RECEIVE_TODO = "RECEIVE_TODO";
export const REMOVE_TODO = "REMOVE_TODO";

//synatactic sugar version of below
// const receiveTodos = (todos) => ({
//     type: RECEIVE_TODOS,
//     todos,
// });

// return allows you to use debugger
const receiveTodos = (todos) => {
    return {
      type: RECEIVE_TODOS,
      todos,
    };
};

const receiveTodo = (todo) => {
    return {
        type: RECEIVE_TODO,
        todo: todo
    };
};

const removeTodo = (id) => {
    return {
        type: REMOVE_TODO,
        id: id
    }
}
