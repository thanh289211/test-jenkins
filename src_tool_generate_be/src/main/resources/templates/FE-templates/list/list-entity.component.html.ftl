<div class="container-fluid ">
    <div class="row">
        <div class="col-12">
            <div class="page-title-box d-flex align-items-center justify-content-between">
                <h4 class="mb-0 font-size-18">${titleCaseName} Managerment</h4>
                <div class="page-title-right">
                    <ol class="breadcrumb m-0">
                        <ng-container>
                            <li class="breadcrumb-item"><a href="javascript: void(0);">{{ 'TABLE.TEXT' | translate }}</a>
                            </li>
                            <li class="breadcrumb-item active">${titleCaseName} Managerment
                            </li>
                        </ng-container>
                    </ol>
                </div>
            </div>
        </div>
    </div>
    <div class="p-4 bg-white mb-5">
        <h5>${titleCaseName} Managerment</h5>
        <button (click)="openAddModal()" nz-button [nzSize]="'small'" nzType="primary"><span nz-icon nzType="plus" nzTheme="outline"></span>{{ 'TABLE.ADD_RECORD' | translate }}</button>
        <!-- <Search> -->
        <div class="row my-md-2">
            <div class="col-sm-12 col-md-6">
                <div class="dataTables_length" id="tickets-table_length"><label
                            class="d-inline-flex align-items-center text-nowrap">{{ 'TABLE.PAGE_SIZE.SHOW' | translate }}
                        <select name="tickets-table_length" aria-controls="tickets-table" name="pageSize"
                                class="form-control form-control-sm mx-2" (change)="pageSizeChange($event.target.value)">
                            <option value="10">10</option>
                            <option value="25">25</option>
                            <option value="50">50</option>
                        </select> {{ 'TABLE.PAGE_SIZE.ENTRIES' | translate }}</label></div>
            </div>
            <!-- Search -->
            <div class="col-sm-12 col-md-6">
                <div id="tickets-table_filter" class="dataTables_filter text-md-end">
                    <label class="d-inline-flex align-items-center text-nowrap"> {{ 'TABLE.SEARCH' | translate }}
                        <input type="text" name="searchTerm" class="form-control form-control-sm ms-2"
                               aria-controls="tickets-table" [(ngModel)]="searchValue" (input)="doSearch()">
                    </label>
                </div>
            </div>
            <!-- End search -->
        </div>
        <nz-table #sortTable nzBordered [nzSize]="'small'" [nzData]="dataList" [nzShowPagination]="false"
                  [nzFrontPagination]="false" nzTableLayout="auto" [nzLoading]="isLoading">
            <thead>
            <tr>
                <th>{{ 'TABLE.NO' | translate }}</th>
                <#list properties as property>
                    <th> ${property.entityName}</th>
                </#list>
                <th>{{ 'TABLE.ACTION.TEXT' | translate }}</th>
            </tr>
            </thead>
            <tbody>
            <tr *ngFor="let record of sortTable.data; let i = index">
                <td>{{ ((pageNumber-1) * pageSize) + i + 1 }}</td>
                <#list properties as property>
                    <td>{{ record.${property.entityName} }} </td>
                </#list>
                <td>
                    <button (click)="openAddModal(record)" nz-button [nzSize]="'small'" nzType="link"><span nz-icon nzType="edit" nzTheme="outline"></span>{{ 'TABLE.ACTION.EDIT' | translate }}</button>
                    <nz-divider nzType="vertical"></nz-divider>
                    <button (click)="doDelete(record)" nz-button [nzSize]="'small'" nzType="link"
                            nzDanger><span nz-icon nzType="delete" nzTheme="outline"></span>{{ 'TABLE.ACTION.DELETE' | translate }}</button>
                </td>
            </tr>
            </tbody>
        </nz-table>
        <div class="row mt-md-2">
            <div class="col-sm-12 col-md-6">
                <p>{{ 'TABLE.PAGE_INFO.SHOWING' | translate }} {{startIndex}} {{ 'TABLE.PAGE_INFO.TO' | translate }} {{endIndex}} {{ 'TABLE.PAGE_INFO.OF' | translate }} {{totalElements}} {{ 'TABLE.PAGE_INFO.ENTRIES' | translate }}</p>
            </div>
            <div class="col-sm-12 col-md-6 text-md-end mt-md-2">
                <nz-pagination [(nzPageIndex)]="pageNumber" [nzTotal]="totalElements" [nzPageSize]="pageSize"
                               (nzPageIndexChange)="onPageChange($event)"></nz-pagination>
            </div>
        </div>
    </div>
</div>