import { ComponentFixture, TestBed } from '@angular/core/testing';

import { Add${pascalCaseName}Component } from './add-${snakeCaseName}.component';

describe('Add${pascalCaseName}Component', () => {
let component: Add${pascalCaseName}Component;
let fixture: ComponentFixture<Add${pascalCaseName}Component>;

    beforeEach(async () => {
    await TestBed.configureTestingModule({
    declarations: [Add${pascalCaseName}Component]
    })
    .compileComponents();

    fixture = TestBed.createComponent(Add${pascalCaseName}Component);
    component = fixture.componentInstance;
    fixture.detectChanges();
    });

    it('should create', () => {
    expect(component).toBeTruthy();
    });
    });