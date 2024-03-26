import { NgModule } from '@angular/core';
import { CommonModule } from '@angular/common';
import { FormsModule, ReactiveFormsModule } from '@angular/forms';

import { TabsModule } from 'ngx-bootstrap/tabs';
import { BsDropdownModule } from 'ngx-bootstrap/dropdown';
import { ModalModule } from 'ngx-bootstrap/modal';
import { TooltipModule } from 'ngx-bootstrap/tooltip';
import { CollapseModule } from 'ngx-bootstrap/collapse';
import { AlertModule } from 'ngx-bootstrap/alert';
import { NgApexchartsModule } from 'ng-apexcharts';
import { FullCalendarModule } from '@fullcalendar/angular';
import { SimplebarAngularModule } from 'simplebar-angular';
import { LightboxModule } from 'ngx-lightbox';
import { PickerModule } from '@ctrl/ngx-emoji-mart';
import { PagesRoutingModule } from './pages-routing.module';
import { DashboardsModule } from './dashboards/dashboards.module';
import { HttpClientModule } from '@angular/common/http';
import { AntDesignModule } from "../core/ant-design.module";

    import { UserEntityModule } from './components/user-entity/user-entity.module';


@NgModule({
declarations: [],
imports: [
AntDesignModule,
CommonModule,
FormsModule,
BsDropdownModule.forRoot(),
ModalModule.forRoot(),
PagesRoutingModule,
NgApexchartsModule,
ReactiveFormsModule,
DashboardsModule,
HttpClientModule,
FullCalendarModule,
TabsModule.forRoot(),
TooltipModule.forRoot(),
CollapseModule.forRoot(),
AlertModule.forRoot(),
SimplebarAngularModule,
LightboxModule,
PickerModule,
//Các entity module gen ra phía dưới
    UserEntityModule,
],
})
export class PagesModule { }
