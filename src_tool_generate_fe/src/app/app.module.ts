import { NgModule } from '@angular/core';
import { BrowserModule } from '@angular/platform-browser';

import { AppRoutingModule } from './app-routing.module';
import { AppComponent } from './app.component';
// import { TopbarComponent } from './core/ui/layout/topbar/topbar.component';
// import { FooterComponent } from './core/ui/layout/footer/footer.component';
import { NZ_I18N } from 'ng-zorro-antd/i18n';
import { en_US } from 'ng-zorro-antd/i18n';
import { registerLocaleData } from '@angular/common';
import en from '@angular/common/locales/en';
import { FormsModule } from '@angular/forms';
import { HttpClientModule } from '@angular/common/http';
import { BrowserAnimationsModule } from '@angular/platform-browser/animations';
// import { NzLayoutModule } from 'ng-zorro-antd/layout';
// import { NzMenuModule } from 'ng-zorro-antd/menu';
// import { LayoutComponent } from './core/ui/layout/layout.component';
import {LayoutModule} from "./core/ui/layout/layout.module";
import {AntDesignModule} from "./core/ant-design.module";
import { ToastrModule } from 'ngx-toastr';
// import { InfoFormComponent } from './pages/info-form/info-form.component';

registerLocaleData(en);

@NgModule({
  declarations: [
    AppComponent
  ],
  imports: [
    AntDesignModule,
    BrowserModule,
    AppRoutingModule,
    FormsModule,
    HttpClientModule,
    BrowserAnimationsModule,
    LayoutModule,
    ToastrModule.forRoot({
      positionClass :'toast-bottom-right'
    })
  ],
  providers: [
    { provide: NZ_I18N, useValue: en_US }
  ],
  bootstrap: [AppComponent]
})
export class AppModule { }
