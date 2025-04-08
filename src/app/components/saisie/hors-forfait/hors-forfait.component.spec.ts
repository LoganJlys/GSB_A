import { ComponentFixture, TestBed } from '@angular/core/testing';

import { HorsForfaitComponent } from './hors-forfait.component';

describe('HorsForfaitComponent', () => {
  let component: HorsForfaitComponent;
  let fixture: ComponentFixture<HorsForfaitComponent>;

  beforeEach(async () => {
    await TestBed.configureTestingModule({
      declarations: [HorsForfaitComponent]
    })
    .compileComponents();

    fixture = TestBed.createComponent(HorsForfaitComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
