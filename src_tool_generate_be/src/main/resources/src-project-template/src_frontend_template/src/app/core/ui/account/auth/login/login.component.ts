import {Component, OnInit} from '@angular/core';
import {UntypedFormBuilder, UntypedFormGroup, Validators} from '@angular/forms';

import {Store} from '@ngrx/store';
import {Router} from '@angular/router';
import {login} from 'src/app/store/authentication/authentication.actions';
import {environment} from "../../../../../../environments/environment";

@Component({
  selector: 'app-login',
  templateUrl: './login.component.html',
  styleUrls: ['./login.component.scss']
})

/**
 * Login component
 */
export class LoginComponent implements OnInit {

  loginForm: UntypedFormGroup;
  submitted: any = false;
  error: any = '';
  returnUrl: string;
  fieldTextType!: boolean;

  year: number = new Date().getFullYear();

  systemName = environment.systemConfig.name;

  constructor(private formBuilder: UntypedFormBuilder, private router: Router, private store: Store) {
  }

  ngOnInit() {
    if (localStorage.getItem('currentUser')) {
      this.router.navigate(['/']);
    }
    this.loginForm = this.formBuilder.group({
      email: ['admin@themesbrand.com', [Validators.required, Validators.email]],
      password: ['123456', [Validators.required]],
    });
  }

  get f() {
    return this.loginForm.controls;
  }

  onSubmit() {
    this.submitted = true;
    const email = this.f['email'].value;
    const password = this.f['password'].value;
    this.store.dispatch(login({email: email, password: password}));
  }

  toggleFieldTextType() {
    this.fieldTextType = !this.fieldTextType;
  }
}
