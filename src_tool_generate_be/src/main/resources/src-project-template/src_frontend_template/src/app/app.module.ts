import {CUSTOM_ELEMENTS_SCHEMA, NgModule, NO_ERRORS_SCHEMA} from '@angular/core';
import {BrowserModule} from '@angular/platform-browser';
import {BrowserAnimationsModule} from '@angular/platform-browser/animations';

import {environment} from '../environments/environment';

// Swiper Slider
import {SlickCarouselModule} from 'ngx-slick-carousel';
// bootstrap component
import {TabsModule} from 'ngx-bootstrap/tabs';
import {TooltipModule} from 'ngx-bootstrap/tooltip';
import {AccordionModule} from 'ngx-bootstrap/accordion';
import {ToastrModule} from 'ngx-toastr';
import {ScrollToModule} from '@nicky-lenaers/ngx-scroll-to';

// Store
import {StoreModule} from '@ngrx/store';
import {StoreDevtoolsModule} from '@ngrx/store-devtools';
import {EffectsModule} from '@ngrx/effects';
// Page Route
import {AppRoutingModule} from './app-routing.module';
import {AppComponent} from './app.component';
import {TranslateLoader, TranslateModule} from '@ngx-translate/core';
import {TranslateHttpLoader} from '@ngx-translate/http-loader';

// Auth
import {HTTP_INTERCEPTORS, HttpClient, HttpClientModule} from '@angular/common/http';
import {ErrorInterceptor} from './core/helpers/error.interceptor';
import {JwtInterceptor} from './core/helpers/jwt.interceptor';
import {FakeBackendInterceptor} from './core/helpers/fake-backend';
import {rootReducer} from './store/store-data';
import {AuthenticationEffects} from './store/authentication/authentication.effects';
import {AngularFireModule} from '@angular/fire/compat';
import {AngularFireAuthModule} from '@angular/fire/compat/auth';
import {LayoutsModule} from "./core/ui/layouts/layouts.module";
import {ExtrapagesModule} from "./core/ui/extrapages/extrapages.module";
import {AntDesignModule} from "./core/ant-design.module";
import { NZ_I18N } from 'ng-zorro-antd/i18n';
import { en_US } from 'ng-zorro-antd/i18n';
import { registerLocaleData } from '@angular/common';
import en from '@angular/common/locales/en';
import { FormsModule } from '@angular/forms';

registerLocaleData(en);

export function createTranslateLoader(http: HttpClient): any {
  return new TranslateHttpLoader(http, 'assets/i18n/', '.json');
}

@NgModule({
  declarations: [
    AppComponent,
  ],
  imports: [
    AntDesignModule,
    BrowserModule,
    BrowserAnimationsModule,
    HttpClientModule,
    AngularFireModule.initializeApp(environment.firebaseConfig),
    AngularFireAuthModule,
    TranslateModule.forRoot({
      loader: {
        provide: TranslateLoader,
        useFactory: createTranslateLoader,
        deps: [HttpClient]
      }
    }),
    LayoutsModule,
    AppRoutingModule,
    ExtrapagesModule,
    AccordionModule.forRoot(),
    TabsModule.forRoot(),
    TooltipModule.forRoot(),
    ScrollToModule.forRoot(),
    SlickCarouselModule,
    ToastrModule.forRoot(),
    StoreModule.forRoot(rootReducer),
    StoreDevtoolsModule.instrument({
      maxAge: 25, // Retains last 25 states
      logOnly: environment.production, // Restrict extension to log-only mode
    }),
    EffectsModule.forRoot([
      AuthenticationEffects,
    ]),
    FormsModule,
  ],
  bootstrap: [AppComponent],
  schemas: [CUSTOM_ELEMENTS_SCHEMA, NO_ERRORS_SCHEMA],
  providers: [
    {provide: HTTP_INTERCEPTORS, useClass: JwtInterceptor, multi: true},
    {provide: HTTP_INTERCEPTORS, useClass: ErrorInterceptor, multi: true},
    {provide: HTTP_INTERCEPTORS, useClass: FakeBackendInterceptor, multi: true},
    { provide: NZ_I18N, useValue: en_US },
  ],
})
export class AppModule {
}
