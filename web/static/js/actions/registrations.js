import { push }   from 'react-router-redux';
import Constants          from '../constants';
import { httpPost }       from '../utils';
import {setCurrentUser}   from './sessions';

const initialState = {
    errors: null,
};

export default function reducer(state = initialState, action = {}) {
    switch (action.type) {
        case Constants.REGISTRATIONS_ERROR:
            return {...state, errors: action.errors};

    default:
        return state;
    }
}

const Actions = {};

Actions.signUp = (data) => {
    return dispatch => {
        httpPost('/api/v1/registrations', {user: data})
            .then((data) => {
            localStorage.setItem('phoenixAuthToken', data.jwt);

        dispatch({
            type: Constants.CURRENT_USER,
            currentUser: data.user,
        });

        dispatch(pushPath('/'));
    })
    .catch((error) => {
        error.response.json()
            .then((errorJSON) => {
                dispatch({
                    type: Constants.REGISTRATIONS_ERROR,
                    errors: errorJSON.errors,
                });
            });
        });
    };
};

export default Actions;