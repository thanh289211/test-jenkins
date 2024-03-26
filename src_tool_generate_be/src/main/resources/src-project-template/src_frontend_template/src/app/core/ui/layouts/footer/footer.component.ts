import {Component, OnInit} from '@angular/core';
import {environment} from "../../../../../environments/environment";

@Component({
  selector: 'app-footer',
  templateUrl: './footer.component.html',
  styleUrls: ['./footer.component.scss']
})

/**
 * Footer component
 */
export class FooterComponent implements OnInit {

  // set the currenr year
  year: number = new Date().getFullYear();
  systemName = environment.systemConfig.name;

  constructor() {
  }

  ngOnInit() {
  }

}
