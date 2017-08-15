import { applyMiddleware, createStore } from 'redux';
import RootReducer from '../reducers/root_reducer';

function addLoggingToDispatch(store) {
  return (next) => {
    return (action) => {
      console.log(store.getState());
      console.log(action);
      next(action);
      console.log(store.getState());
    };
  };
}

function newLogging(store) {
  return (next) => {
    return (action) => {
      console.log(next);
      // next(action);
    };
  };
}

const configureStore = (preloadedState = {}) => {
  const store = createStore(RootReducer, preloadedState,
    applyMiddleware(addLoggingToDispatch, newLogging));
  store.subscribe(() => {
    localStorage.state = JSON.stringify(store.getState());
  });
  return store;
}

export default configureStore;
