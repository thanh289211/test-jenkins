<ng-container>
    <form [formGroup]="form" >
        <div class="d-flex flex-wrap">
            <#assign id = "id">
            <#list properties as property>
                <#assign entityName = property.entityName>
                <#if entityName == id>
                    <input hidden nz-input type="text" formControlName="id">
                <#else>
                    <div #myInput class="mb-md-3 px-2">
                        <label style="display: block;">${property.entityName}:</label>
                        <input nz-input type="text" formControlName="${property.entityName}">
                    </div>
                </#if>
            </#list>
        </div>
        <div class="text-md-end">
            <button class="me-2" (click)="cancel()" nz-button [nzSize]="'default'" nzType="secondary"><span nz-icon nzType="close" nzTheme="outline"></span>{{'TABLE.ADD_MODAL.CANCEL' | translate}}</button>
            <button (click)="doSave()" nz-button [nzSize]="'default'" nzType="primary"><span nz-icon nzType="save" nzTheme="outline"></span>{{'TABLE.ADD_MODAL.SAVE' | translate}}</button>
        </div>
    </form>
</ng-container>