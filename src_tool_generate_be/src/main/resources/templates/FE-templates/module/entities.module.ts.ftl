import { NgModule } from "@angular/core";
import { CommonModule } from "@angular/common";
import { NgOtpInputModule } from "ng-otp-input";
import { AntDesignModule } from "src/app/core/ant-design.module";
import { FormsModule, ReactiveFormsModule } from "@angular/forms";
import { TranslateModule } from "@ngx-translate/core";

import { List${pascalCaseName}Component } from "./component/list/list-${snakeCaseName}.component";
import { Add${pascalCaseName}Component } from "./component/add/add-${snakeCaseName}.component";

@NgModule({
declarations: [
List${pascalCaseName}Component,
Add${pascalCaseName}Component,
],
imports: [
CommonModule,
NgOtpInputModule,
AntDesignModule,
FormsModule,
ReactiveFormsModule,
TranslateModule,
]
})
export class ${pascalCaseName}Module { }