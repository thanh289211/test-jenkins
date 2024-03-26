 import { Component, OnInit } from '@angular/core';
            import { ${pascalCaseName} } from '../../model/${snakeCaseName}';
            import { PageRequest, ResponseData } from '../../../../../core/shared/shared-model/shared-model';
            import { NzModalRef, NzModalService } from 'ng-zorro-antd/modal';
            import { debounce } from 'lodash';
            import { ${pascalCaseName}Service } from '../../services/${snakeCaseName}.services';
            import { BASE_RESPONSE, MODAL_SIZE, PAGINATION } from 'src/app/pages/constants/commons';
            import { ToastrService } from 'ngx-toastr';
            import { Observable } from 'rxjs';
            import { Add${pascalCaseName}Component } from '../add/add-${snakeCaseName}.component';
            import { TranslateService } from '@ngx-translate/core';


            @Component({
            selector: 'app-list-${snakeCaseName}',
            templateUrl: './list-${snakeCaseName}.component.html',
            styleUrls: ['./list-${snakeCaseName}.component.scss']
            })
            export class List${pascalCaseName}Component implements OnInit {
            dataList: ${pascalCaseName}[] = [];
            searchValue = '';
            totalElements = 0;
            startIndex = 0;
            endIndex = 0;
            pageSize = PAGINATION.PAGE_SIZE;
            pageNumber = PAGINATION.PAGE_NUMBER;
            isLoading: boolean;
            confirmModal?: NzModalRef;
            modalAdd?: NzModalRef;

            constructor(
            public translate: TranslateService,
            private ${camelCaseName}Service: ${pascalCaseName}Service,
            private modal: NzModalService,
            private toastrService: ToastrService,
            private modalService: NzModalService,
            ) { }

            ngOnInit(): void {
            this.getList();
            }

            getList() {
            this.isLoading = true;
            const pageRequest: PageRequest = {
            pageSize: this.pageSize,
            pageNumber: this.pageNumber
            };
            this.${camelCaseName}Service.getList(pageRequest).subscribe({
            next: (response: ResponseData) => {
            if (response && response.messageCode == BASE_RESPONSE.SUCCESS) {
            this.pageNumber = response.data.number + 1;
            this.dataList = response.data.content;
            this.totalElements = response.data.totalElements;
            this.calculateIndices();
            this.isLoading = false;
            } else {
            this.toastrService.error(response.message)
            this.isLoading = false;
            }
            },
            error: (e) => {
            this.isLoading = false;
            this.toastrService.error(this.translate.instant("TABLE.MESSAGE.COMMON_ERROR"));
            },
            }
            );
            }

            doSearch = debounce(() => {
            if (this.searchValue.trim() !== "") {
            const searchRequest = {
            pageSize: this.pageSize,
            pageNumber: this.pageNumber,
            value: this.searchValue,
            };
            this.isLoading = true;
            this.${camelCaseName}Service.search(searchRequest).subscribe({
            next: (response: ResponseData) => {
            if (response && response.messageCode == BASE_RESPONSE.SUCCESS) {
            this.dataList = response.data.content;
            this.isLoading = false;
            this.toastrService.success(response.message)
            } else {
            this.isLoading = false
            this.toastrService.error(response.message);
            }
            },
            error: (e) => {
            this.isLoading = false;
            this.toastrService.error(this.translate.instant("TABLE.MESSAGE.COMMON_ERROR"));
            },
            });
            } else {
            this.getList();
            }
            }, 500);

            onPageChange(pageNumber: number) {
            this.pageNumber = pageNumber;
            this.doSearch();
            }

            private handleRequest(
            serviceFunction: Observable<ResponseData>,
                successMessage: string,
                errorMessage: string
                ): void {
                serviceFunction.subscribe({
                next: (response: ResponseData) => {
                if (response && response.messageCode === BASE_RESPONSE.SUCCESS) {
                this.getList();
                this.toastrService.success(successMessage);
                } else {
                this.isLoading = false;
                this.toastrService.error(response.message);
                }
                },
                error: (e) => {
                this.isLoading = false;
                this.toastrService.error(errorMessage);
                },
                });
                }

                doDelete(record: ${pascalCaseName}) {
                this.confirmModal = this.modal.confirm({
                nzTitle: this.translate.instant('TABLE.CONFIRM.DEL_TITLE'),
                nzContent: this.translate.instant('TABLE.CONFIRM.DEL_CONTENT'),
                nzOnOk: () => {
                this.handleRequest(
                this.${camelCaseName}Service.delete(record.id),
                this.translate.instant("TABLE.MESSAGE.DEL_SUCCESS"),
                this.translate.instant("TABLE.MESSAGE.DEL_ERROR")
                );
                }
                });
                }

                openAddModal(record?: ${pascalCaseName}){
                this.modalAdd = this.modalService.create({
                nzTitle:  this.translate.instant('TABLE.MODAL.TITLE'),
                nzContent: Add${pascalCaseName}Component,
                nzWidth: MODAL_SIZE.MEDIUM,
                nzClosable: true,
                nzKeyboard: false,
                nzFooter: null,
                nzData: record
                });
                this.modalAdd.afterClose.subscribe(value => {
                this.modalAdd.destroy();
                if (value?.refresh == true) {
                this.getList();
                }
                });
                }

                pageSizeChange(newPageSize: number) {
                this.pageSize = newPageSize;
                this.calculateIndices();
                this.getList();
                }

                private calculateIndices() {
                this.startIndex = (this.pageSize * (this.pageNumber - 1)) + 1;
                this.endIndex = Math.min(this.pageSize * this.pageNumber, this.totalElements);
                }
                }
