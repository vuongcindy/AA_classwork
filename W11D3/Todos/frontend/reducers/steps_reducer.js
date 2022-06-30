import { RECEIVE_STEP } from "../actions/step_actions";
import { RECEIVE_STEPS } from "../actions/step_actions";
import { REMOVE_STEP } from "../actions/step_actions";

const initialState = {
    1: {
      id: 1,
      title: "frog",
      done: false,
      todo_id: 1
    },
    2: {
      id: 2,
      title: "chicken",
      done: true,
      todo_id: 1
    },
    3: {
        id: 3,
        title: "tiger",
        done: false,
        todo_id: 1
      }
  };

const stepsReducer = (state = initialState, action) => {
    Object.freeze(state);
    const nextState = Object.assign({}, state);
    
    switch (action.type) {
        case RECEIVE_STEPS:
            action.steps.forEach((step) => {
              nextState[step.id] = step
            })
            return nextState
        case RECEIVE_STEP:
            nextState[action.step.id] = action.step;
            return nextState
        case REMOVE_STEP:
            delete nextState[action.id]
            return nextState;
        default:
            return state;
          
    }
};

export default stepsReducer;