import { TestBed } from '@angular/core/testing';

import { HorsForfaitService } from './hors-forfait.service';

describe('HorsForfaitService', () => {
  let service: HorsForfaitService;

  beforeEach(() => {
    TestBed.configureTestingModule({});
    service = TestBed.inject(HorsForfaitService);
  });

  it('should be created', () => {
    expect(service).toBeTruthy();
  });
});
