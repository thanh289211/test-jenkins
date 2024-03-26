import {Component, OnInit} from '@angular/core';
import {UntypedFormBuilder, UntypedFormGroup, Validators} from '@angular/forms';
import {ActivatedRoute, Router} from '@angular/router';
import {Store} from '@ngrx/store';
import {Register} from 'src/app/store/authentication/authentication.actions';
import {environment} from "../../../../../../environments/environment";
import {AuthenticationService} from "../../../../services/auth.service";
import {UserProfileService} from "../../../../services/user.service";

@Component({
  selector: 'app-signup',
  templateUrl: './signup.component.html',
  styleUrls: ['./signup.component.scss']
})
export class SignupComponent implements OnInit {

  signupForm: UntypedFormGroup;
  submitted: any = false;
  error: any = '';
  successmsg: any = false;

  // set the currenr year
  year: number = new Date().getFullYear();
  systemName = environment.systemConfig.name;

  // tslint:disable-next-line: max-line-length
  constructor(private formBuilder: UntypedFormBuilder, private route: ActivatedRoute, private router: Router, private authenticationService: AuthenticationService,
              private userService: UserProfileService, public store: Store) {
  }

  ngOnInit() {
    this.signupForm = this.formBuilder.group({
      username: ['', Validators.required],
      email: ['', [Validators.required, Validators.email]],
      password: ['', Validators.required],
    });
  }

  // convenience getter for easy access to form fields
  get f() {
    return this.signupForm.controls;
  }

  /**
   * On submit form
   */
  onSubmit() {
    this.submitted = true;

    // stop here if form is invalid

    const email = this.f['email'].value;
    const name = this.f['username'].value;
    const password = this.f['password'].value;

    //Dispatch Action
    this.store.dispatch(Register({email: email, username: name, password: password}));
  }
}
