import {ActionReducerMap} from "@ngrx/store";
import {AuthenticationState, authenticationReducer} from "./authentication/authentication.reducer";
import {LayoutState, layoutReducer} from "./layouts/layouts.reducer";

export interface RootReducerState {
  layout: LayoutState;
  auth: AuthenticationState
}

export const rootReducer: ActionReducerMap<RootReducerState> = {
  layout: layoutReducer,
  auth: authenticationReducer
}
