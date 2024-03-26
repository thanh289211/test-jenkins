import { TestBed } from '@angular/core/testing';

import { SourceInfoService } from './source-info.service';

describe('SourceInfoService', () => {
  let service: SourceInfoService;

  beforeEach(() => {
    TestBed.configureTestingModule({});
    service = TestBed.inject(SourceInfoService);
  });

  it('should be created', () => {
    expect(service).toBeTruthy();
  });
});
