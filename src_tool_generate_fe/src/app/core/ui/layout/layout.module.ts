import { NgModule } from '@angular/core';
import {CommonModule, NgOptimizedImage} from '@angular/common';
import {RouterModule} from "@angular/router";
import {TopbarComponent} from "./topbar/topbar.component";
import {FooterComponent} from "./footer/footer.component";
import {LayoutComponent} from "./layout.component";
import {AntDesignModule} from "../../ant-design.module";



@NgModule({
  declarations: [LayoutComponent, TopbarComponent, FooterComponent],
  imports: [
    CommonModule,
    RouterModule,
    NgOptimizedImage
  ]
})
export class LayoutModule { }
