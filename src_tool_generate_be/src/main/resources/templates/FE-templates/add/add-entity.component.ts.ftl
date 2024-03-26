import { ${pascalCaseName} } from './../../model/${snakeCaseName}';
import { Component, ElementRef, Inject, OnInit, QueryList, Renderer2, ViewChildren } from '@angular/core';
import { FormControl, FormGroup, Validators } from '@angular/forms';
import { NZ_MODAL_DATA, NzModalRef } from 'ng-zorro-antd/modal';
import { ${pascalCaseName}Service } from '../../services/${snakeCaseName}.services';
import { ToastrService } from 'ngx-toastr';
import { Observable } from 'rxjs';
import { ResponseData } from 'src/app/core/shared/shared-model/shared-model';
import { BASE_RESPONSE } from 'src/app/pages/constants/commons';
import { TranslateService } from '@ngx-translate/core';

    @Component({
    selector: 'app-add-${snakeCaseName}',
    templateUrl: './add-${snakeCaseName}.component.html',
    styleUrl: './add-${snakeCaseName}.component.scss'
    })
    export class Add${pascalCaseName}Component implements OnInit {
    isVisible = false;
    form!: FormGroup;
    @ViewChildren('myInput') myInputs: QueryList<ElementRef>;

        constructor(
        private renderer: Renderer2,
        public translate: TranslateService,
        private ${camelCaseName}Service: ${pascalCaseName}Service,
        private modalRef: NzModalRef,
        private toastrService: ToastrService,
        @Inject(NZ_MODAL_DATA) public data: ${pascalCaseName}) { }

        // điều chỉnh chiều rộng ô input tuỳ theo số lượng input
        ngAfterViewInit() {
        const numberOfInput = this.myInputs.length;
        this.myInputs.forEach((input: ElementRef) => {
        switch (true) {
        case (numberOfInput > 10):
        this.renderer.addClass(input.nativeElement, 'w-25');
        break;
        case (numberOfInput > 5):
        this.renderer.addClass(input.nativeElement, 'w-50');
        break;
        default:
        this.renderer.addClass(input.nativeElement, 'w-100');
        break;
        }
        });
        }

        ngOnInit() {
        this.form = new FormGroup({
        <#list properties as property>
            ${property.entityName}: new FormControl(null),
        </#list>
        });
        if (this.data !== undefined) {
        this.form.setValue({
        <#list properties as property>
            ${property.entityName}: this.data.${property.entityName},
        </#list>
        });
        }
        }

        cancel() {
        this.modalRef.close({ refresh: false });
        }

        private handleRequest(
        serviceFunction: Observable<ResponseData>,
            successMessage: string,
            errorMessage: string
            ): void {
            serviceFunction.subscribe({
            next: (response: ResponseData) => {
            if (response && response.messageCode === BASE_RESPONSE.SUCCESS) {
            this.toastrService.success(successMessage);
            this.modalRef.close({ refresh: true });
            } else {
            this.toastrService.error(response.message);
            this.modalRef.close({ refresh: false });
            }
            },
            error: (e) => {
            this.toastrService.error(errorMessage);
            this.modalRef.close({ refresh: false });
            },
            });
            }

            doSave() {
            if (this.form.valid) {
            const object: ${pascalCaseName} = this.form.value;
            const serviceFunction =
            object.id === null
            ? this.${camelCaseName}Service.add(object)
            : this.${camelCaseName}Service.update(object);
            const successMessage =
            object.id === null ? this.translate.instant("TABLE.MESSAGE.ADD_SUCCESS") : this.translate.instant("TABLE.MESSAGE.EDIT_SUCCESS");
            const errorMessage = this.translate.instant("TABLE.MESSAGE.ADDOREDIT_ERROR");
            this.handleRequest(serviceFunction, successMessage, errorMessage);
            }
            }

            }
