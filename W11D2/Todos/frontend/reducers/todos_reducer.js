import { RECEIVE_TODO } from "../actions/todo_actions";
import { RECEIVE_TODOS } from "../actions/todo_actions";
import { REMOVE_TODO } from "../actions/todo_actions"

const initialState = {
    1: {
      id: 1,
      title: "submit fullstack project proposal",
      body: "with 3 projects",
      done: false
    },
    2: {
      id: 2,
      title: "progress tracker",
      body: "report and url",
      done: false
    },
    3: {
        id: 3,
        title: "reading",
        body: "app academy open",
        done: false
      }
  };

const todosReducer = (state = initialState, action) =>{
    Object.freeze(state);
    const nextState = Object.assign({}, state);
    
    switch (action.type) {
        case RECEIVE_TODOS:
            action.todos.forEach((todo) =>{
              nextState[todo.id] = todo
            })
            return nextState
        case RECEIVE_TODO:
            nextState[action.todo.id] = action.todo;
            return nextState
        case REMOVE_TODO:
            delete nextState[action.id]
            return nextState;
            // nextState[action.todo.id] = undefined;
            // const idx = state.indexOf(action.todos);
            // if( idx !== -1 ){
            //   return [...state.slice(0, idx), ...state.slice(idx + 1)]
            // }
            // return { todos: state.todos.filter((todo) => todo !== action.todo) };
            // return action.todos.filter(todo => todo.id !== action.id)
        default:
            return state;
          
    }
};

export default todosReducer;