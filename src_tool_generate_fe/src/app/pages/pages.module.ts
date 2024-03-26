import { NgModule } from '@angular/core';
import { CommonModule } from '@angular/common';

import { PagesRoutingModule } from './pages-routing.module';
import {AntDesignModule} from "../core/ant-design.module";
import {InfoFormComponent} from "./info-form/info-form.component";
import {ReactiveFormsModule} from "@angular/forms";


@NgModule({
  declarations: [InfoFormComponent],
  imports: [
    CommonModule,
    PagesRoutingModule,
    AntDesignModule,
    ReactiveFormsModule,
  ]
})
export class PagesModule { }
