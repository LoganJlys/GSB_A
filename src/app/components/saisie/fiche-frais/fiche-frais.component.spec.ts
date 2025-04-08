import { ComponentFixture, TestBed } from '@angular/core/testing';

import { FicheFraisComponent } from './fiche-frais.component';

describe('FicheFraisComponent', () => {
  let component: FicheFraisComponent;
  let fixture: ComponentFixture<FicheFraisComponent>;

  beforeEach(async () => {
    await TestBed.configureTestingModule({
      declarations: [FicheFraisComponent]
    })
    .compileComponents();

    fixture = TestBed.createComponent(FicheFraisComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
