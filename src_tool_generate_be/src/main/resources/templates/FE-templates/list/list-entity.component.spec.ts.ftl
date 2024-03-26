import { ComponentFixture, TestBed } from '@angular/core/testing';

import { List${pascalCaseName}Component } from './list-${snakeCaseName}.component';

describe('List${pascalCaseName}Component', () => {
let component: List${pascalCaseName}Component;
let fixture: ComponentFixture<List${pascalCaseName}Component>;

    beforeEach(async () => {
    await TestBed.configureTestingModule({
    declarations: [List${pascalCaseName}Component]
    })
    .compileComponents();

    fixture = TestBed.createComponent(List${pascalCaseName}Component);
    component = fixture.componentInstance;
    fixture.detectChanges();
    });

    it('should create', () => {
    expect(component).toBeTruthy();
    });
    });
