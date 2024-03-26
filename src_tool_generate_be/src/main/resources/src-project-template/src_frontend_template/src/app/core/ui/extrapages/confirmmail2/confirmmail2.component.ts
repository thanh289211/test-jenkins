import { Component, OnInit } from '@angular/core';
import {environment} from "../../../../../environments/environment";

@Component({
  selector: 'app-confirmmail2',
  templateUrl: './confirmmail2.component.html',
  styleUrls: ['./confirmmail2.component.scss']
})
export class Confirmmail2Component implements OnInit {

  constructor() { }
  // set the currenr year
  year: number = new Date().getFullYear();
  systemName = environment.systemConfig.name;

  ngOnInit(): void {
  }

  // swiper config
  slideConfig = {
    slidesToShow: 1,
    slidesToScroll: 1,
    arrows: false,
    dots: true
  };
}
