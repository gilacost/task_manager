import { combineReducers }  from 'redux';
import { routerReducer }    from 'react-router-redux';
import session              from '../actions/sessions';

export default combineReducers({
    routing: routeReducer,
    session: session,
});