import { createAction, props } from '@ngrx/store';
import { User } from './auth.models';

// Register action
export const Register = createAction('[authentication] Register', props<{ email: string, username: string, password: string }>());
export const RegisterSuccess = createAction('[authentication] Register Success', props<{ user: User }>());
export const RegisterFailure = createAction('[authentication] Register Failure', props<{ error: string }>());

// login action
export const login = createAction('[authentication] Login', props<{ email: string, password: string }>());
export const loginSuccess = createAction('[authentication] Login Success', props<{ user: any }>());
export const loginFailure = createAction('[authentication] Login Failure', props<{ error: any }>());

// logout action
export const logout = createAction('[authentication] Logout');

export const logoutSuccess = createAction('[Auth] Logout Success');


