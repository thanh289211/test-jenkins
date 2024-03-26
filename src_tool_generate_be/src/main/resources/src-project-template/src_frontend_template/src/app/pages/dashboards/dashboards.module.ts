import { NgModule } from '@angular/core';
import { CommonModule } from '@angular/common';
import { FormsModule, ReactiveFormsModule } from '@angular/forms';

import { DashboardsRoutingModule } from './dashboards-routing.module';

import { NgApexchartsModule } from 'ng-apexcharts';

import { TooltipModule } from 'ngx-bootstrap/tooltip';
import { BsDropdownModule,BsDropdownConfig} from 'ngx-bootstrap/dropdown';
import { CarouselModule } from 'ngx-bootstrap/carousel';
import { TabsModule } from 'ngx-bootstrap/tabs';
import { ModalModule } from 'ngx-bootstrap/modal';

import { SimplebarAngularModule } from 'simplebar-angular';

import { DefaultComponent } from './default/default.component';
import {NzTableComponent} from "ng-zorro-antd/table";
import {NzDividerComponent} from "ng-zorro-antd/divider";

@NgModule({
  declarations: [DefaultComponent],
  imports: [
    CommonModule,
    FormsModule,
    ReactiveFormsModule,
    DashboardsRoutingModule,
    BsDropdownModule.forRoot(),
    TooltipModule.forRoot(),
    TabsModule.forRoot(),
    CarouselModule.forRoot(),
    SimplebarAngularModule,
    ModalModule.forRoot(),
    NzTableComponent,
    NzDividerComponent
  ],
  providers: [BsDropdownConfig],
})
export class DashboardsModule { }
