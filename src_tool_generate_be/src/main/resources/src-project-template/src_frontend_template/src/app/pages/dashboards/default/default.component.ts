import {Component, OnInit, ViewChild} from '@angular/core';
import {BsModalRef, ModalDirective} from 'ngx-bootstrap/modal';

import {ConfigService} from '../../../core/services/config.service';
import {environment} from "../../../../environments/environment";

@Component({
  selector: 'app-default',
  templateUrl: './default.component.html',
  styleUrls: ['./default.component.scss']
})
export class DefaultComponent implements OnInit {
  modalRef?: BsModalRef;
  isVisible: string;

  transactions: any;
  statData: any;
  config: any = {
    backdrop: true,
    ignoreBackdropClick: true
  };

  isActive: string;
  systemName = environment.systemConfig.name;
  @ViewChild('content') content;
  @ViewChild('center', {static: false}) center?: ModalDirective;

  constructor(private configService: ConfigService) {
  }

  ngOnInit() {
    const attribute = document.body.getAttribute('data-layout');
    this.isVisible = attribute;
    const vertical = document.getElementById('layout-vertical');
    if (vertical != null) {
      vertical.setAttribute('checked', 'true');
    }
    if (attribute == 'horizontal') {
      const horizontal = document.getElementById('layout-horizontal');
      if (horizontal != null) {
        horizontal.setAttribute('checked', 'true');
      }
    }
    this.fetchData();
  }

  private fetchData() {
    this.isActive = 'year';
    this.configService.getConfig().subscribe(data => {
      this.transactions = data.transactions;
      this.statData = data.statData;
    });
  }

}
