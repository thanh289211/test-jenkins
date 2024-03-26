import { NgModule } from '@angular/core';
import { RouterModule, Routes } from '@angular/router';
import {InfoFormComponent} from "./info-form/info-form.component";

const routes: Routes = [
  {
    path: '',
    component: InfoFormComponent
  },
];

@NgModule({
  imports: [RouterModule.forChild(routes)],
  exports: [RouterModule]
})
export class PagesRoutingModule { }
