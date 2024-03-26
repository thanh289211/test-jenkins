import { Component, OnInit } from '@angular/core';
import { FormBuilder, FormGroup, Validators } from "@angular/forms";
import { SourceInfoService } from '../services/source-info.service';
import { SourceInfo } from '../models/source-info';
import * as fileSaver from 'file-saver';
import { ToastrService } from 'ngx-toastr';

@Component({
  selector: 'app-info-form',
  templateUrl: './info-form.component.html',
  styleUrls: ['./info-form.component.css']
})
export class InfoFormComponent implements OnInit {
  form: FormGroup;
  springVersion = [
    { label: "3.2.3", value: "3.2.3" },
    { label: "2.7.2", value: "2.7.2" },
    // { label: "3.2.0", value: "3.2.0" },
  ]

  angularVersion = [
    { label: "17", value: "17" },
    // { label: "16", value: "16" },
  ]

  javaVersion = [
    { label: "17", value: "17" },
    { label: "19", value: "19" },
    { label: "20", value: "20" },
  ]

  databaseType = [
    { value: "maria", label: "Maria DB" },
    { value: "mysql", label: "MySQL DB" },
  ]

  constructor(
    private fb: FormBuilder, 
    private service: SourceInfoService,
    private toastrService: ToastrService,) 
    {
    this.form = this.fb.group({
      artifactID: ["demo", [Validators.required]],
      groupId: ["com.example", [Validators.required]],
      springVersion: ["3.3.0", [Validators.required]],
      name: ["demo", [Validators.required]],
      description: ["Demo project", [Validators.required]],
      packageName: ["com.example.demo", [Validators.required]],
      javaVersion: ["17", [Validators.required]],
      angularVersion: ["17", [Validators.required]],
      databaseType: ["maria", [Validators.required]],
      databaseUrl: [null, [Validators.required]],
      username: [null, [Validators.required]],
      password: [null, [Validators.required]],
    });

  }

  ngOnInit(): void {
    // Subscribe to changes in groupId and artifactID controls
    this.form.get('groupId')?.valueChanges.subscribe(() => {
      this.updatePackageName(); // Update package name whenever groupId changes
    });
    this.form.get('artifactID')?.valueChanges.subscribe(() => {
      this.updatePackageName(); // Update package name whenever artifactID changes
    });
  }

  updatePackageName(): void {
    const groupId = this.form.get('groupId')?.value;
    const artifactID = this.form.get('artifactID')?.value;

    // Concatenate groupId and artifactID and update the packageName control
    const packageName = `${groupId}.${artifactID}`;
    this.form.get('packageName')?.setValue(packageName);
  }

  submitForm(): void {
    for (const i in this.form.controls) {
      if (this.form.controls.hasOwnProperty(i)) {
        this.form.controls[i].markAsDirty();
        this.form.controls[i].updateValueAndValidity();
      }
    }

    if (this.form.valid) {
      const data: SourceInfo = this.form.value;
      this.service.generateFile(data)
        .subscribe(
          {
            next: (response) => {
                var contentDisposition = response.headers.get('content-disposition');
                var filename = contentDisposition?.split(';')[1].split('filename')[1].split('=')[1].trim();
                this.saveFile(response.body, filename);
            },
            error: (e) => {
              if(e.status === 400){
                this.toastrService.error("Kiểm tra lại thông tin đầu vào!","Lỗi!", {positionClass:'toast-top-right'})
              }
              else {
                this.toastrService.error("Vui lòng thử lại sau!","Lỗi Server!", {positionClass:'toast-top-right'})
              }
            }
          }
        );
    }
  }

  saveFile(data: any, fileName?: string) {
    const blob = new Blob([data], { type: 'application/zip' });
    fileSaver.saveAs(blob, fileName);
    this.toastrService.success("Kiểm tra thư mục tải về.","Thành công!", {positionClass:'toast-top-right'})
  }
}
