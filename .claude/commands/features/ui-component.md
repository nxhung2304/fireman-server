---
description: Generate React/Vue component boilerplate
argument-hint: [component_type] [component_name]
---

Generate reusable [component_type] component: $2

## Instructions
Based on the component type and name, create a comprehensive, reusable component with:

1. **Component Structure**:
   - Main component file with proper structure
   - Component-specific styles
   - Unit test file template
   - Storybook/story file for component documentation
   - TypeScript interfaces and types

2. **Component Features**:
   - Props with TypeScript validation
   - State management where needed
   - Event handlers and callbacks
   - Accessibility features (ARIA labels, keyboard navigation)
   - Responsive design considerations

3. **Best Practices**:
   - Component composition patterns
   - Performance optimization (memoization, lazy loading)
   - Error boundaries and error handling
   - SEO optimization where applicable

## Output Format
```
# Generated Component: [ComponentType] - [ComponentName]

## File Structure
```
src/components/[componentType]/
├── [ComponentName].tsx
├── [ComponentName].test.tsx
├── [ComponentName].stories.tsx
├── [ComponentName].module.css
├── types.ts
└── index.ts
```

## Main Component File

### [ComponentName].tsx
```typescript
import React, { 
  useState, 
  useEffect, 
  useMemo, 
  useCallback,
  forwardRef,
  useImperativeHandle
} from 'react';
import classNames from 'classnames';
import styles from './[ComponentName].module.css';
import { [ComponentName]Props, [ComponentName]Ref } from './types';

/**
 * [ComponentName] - [Brief description of component purpose]
 * 
 * @example
 * ```tsx
 * <[ComponentName] 
 *   [prop1]="value1"
 *   [prop2]="value2"
 *   on[Event]="handleEvent"
 * />
 * ```
 */
export const [ComponentName] = forwardRef<[ComponentName]Ref, [ComponentName]Props>(
  (
    {
      [prop1] = '[default_value]',
      [prop2] = '[default_value]',
      className,
      children,
      on[Event],
      disabled = false,
      'data-testid': dataTestId,
      ...restProps
    },
    ref
  ) => {
    // State management
    const [internalState, setInternalState] = useState<[type]>([initial_value]);
    
    // Ref for DOM manipulation
    const componentRef = React.useRef<HTMLDivElement>(null);

    // Computed values with useMemo for performance
    const computedValue = useMemo(() => {
      return [compute_logic];
    }, [[dependency_array]]);

    // Event handlers with useCallback for performance
    const handle[Event] = useCallback(
      (event: React.[EventType]<[Element]>) => {
        if (disabled) return;
        
        // Handle the event
        const [result] = [event_handling_logic];
        
        // Call parent callback if provided
        on[Event]?.([result], event);
      },
      [disabled, [dependencies], on[Event]]
    );

    // Side effects
    useEffect(() => {
      // Component did mount/update logic
      
      return () => {
        // Cleanup logic
      };
    }, [[dependency_array]]);

    // Imperative methods exposed via ref
    useImperativeHandle(ref, () => ({
      focus: () => componentRef.current?.focus(),
      blur: () => componentRef.current?.blur(),
      getValue: () => internalState,
      setValue: (value: [type]) => setInternalState(value),
    }), []);

    // CSS classes with conditional logic
    const cssClasses = classNames(
      styles.[componentName],
      {
        [styles.disabled]: disabled,
        [styles.active]: [active_condition],
      },
      className
    );

    return (
      <div
        ref={componentRef}
        className={cssClasses}
        disabled={disabled}
        data-testid={dataTestId}
        role="[role]"
        aria-label="[aria_label]"
        aria-describedby="[aria_describedby]"
        tabIndex={disabled ? -1 : 0}
        onKeyDown={(e) => {
          // Keyboard navigation
          if (e.key === 'Enter' || e.key === ' ') {
            handle[Event](e);
          }
        }}
        {...restProps}
      >
        {/* Component content */}
        {children}
        
        {/* Additional component structure */}
        <div className={styles.[subElement]}>
          {/* Sub-component content */}
        </div>
      </div>
    );
  }
);

[ComponentName].displayName = '[ComponentName]';
```

### types.ts
```typescript
import { ReactNode, CSSProperties } from 'react';

export interface [ComponentName]Props {
  /** Primary content of the component */
  children?: ReactNode;
  
  /** [Prop1 description] */
  [prop1]: [PropType];
  
  /** [Prop2 description] */
  [prop2]?: [PropType];
  
  /** Additional CSS class name */
  className?: string;
  
  /** Disables the component */
  disabled?: boolean;
  
  /** Callback for [event] event */
  on[Event]?: (value: [CallbackValueType], event: React.[EventType]<[Element]>) => void;
  
  /** Test ID for testing purposes */
  'data-testid'?: string;
  
  /** Additional props */
  [key: string]: any;
}

export interface [ComponentName]Ref {
  /** Programmatically focus the component */
  focus: () => void;
  
  /** Programmatically blur the component */
  blur: () => void;
  
  /** Get current value */
  getValue: () => [ValueType];
  
  /** Set current value */
  setValue: (value: [ValueType]) => void;
}
```

### [ComponentName].module.css
```css
.[componentName] {
  /* Base component styles */
  display: [display];
  align-items: [alignment];
  justify-content: [justification];
  padding: [padding];
  border: [border];
  border-radius: [border_radius];
  background-color: [background_color];
  color: [text_color];
  font-family: [font_family];
  font-size: [font_size];
  line-height: [line_height];
  transition: [transition_properties];
  
  /* Interactive states */
  &:hover:not(.disabled) {
    background-color: [hover_background];
    border-color: [hover_border];
    cursor: pointer;
  }
  
  &:focus {
    outline: [outline_style];
    box-shadow: [focus_shadow];
  }
  
  &:active:not(.disabled) {
    transform: [active_transform];
    background-color: [active_background];
  }
}

.[componentName].disabled {
  opacity: 0.6;
  cursor: not-allowed;
  pointer-events: none;
}

.[componentName].active {
  background-color: [active_background_color];
  border-color: [active_border_color];
  color: [active_text_color];
}

/* Sub-elements */
.[componentName]__[subElement] {
  /* Sub-element specific styles */
}

/* Responsive design */
@media (max-width: 768px) {
  .[componentName] {
    padding: [mobile_padding];
    font-size: [mobile_font_size];
  }
}

/* Accessibility */
@media (prefers-reduced-motion: reduce) {
  .[componentName] {
    transition: none;
  }
}

/* Dark mode support */
@media (prefers-color-scheme: dark) {
  .[componentName] {
    background-color: [dark_background];
    color: [dark_text_color];
    border-color: [dark_border_color];
  }
}
```

### [ComponentName].test.tsx
```typescript
import React from 'react';
import { render, screen, fireEvent, waitFor } from '@testing-library/react';
import userEvent from '@testing-library/user-event';
import { [ComponentName] } from './[ComponentName]';
import type { [ComponentName]Props } from './types';

const defaultProps: [ComponentName]Props = {
  [prop1]: '[default_value]',
  'data-testid': '[component-name]',
};

describe('[ComponentName]', () => {
  it('renders without crashing', () => {
    render(<[ComponentName] {...defaultProps} />);
    expect(screen.getByTestId('[component-name]')).toBeInTheDocument();
  });

  it('applies custom className', () => {
    const customClass = 'custom-class';
    render(<[ComponentName] {...defaultProps} className={customClass} />);
    expect(screen.getByTestId('[component-name]')).toHaveClass(customClass);
  });

  it('handles [event] events', async () => {
    const mockOn[Event] = jest.fn();
    const user = userEvent.setup();
    
    render(<[ComponentName] {...defaultProps} on[Event]={mockOn[Event]} />);
    
    const component = screen.getByTestId('[component-name]');
    await user.click(component);
    
    expect(mockOn[Event]).toHaveBeenCalledTimes(1);
  });

  it('is disabled when disabled prop is true', () => {
    render(<[ComponentName] {...defaultProps} disabled />);
    expect(screen.getByTestId('[component-name]')).toBeDisabled();
  });

  it('does not trigger events when disabled', async () => {
    const mockOn[Event] = jest.fn();
    const user = userEvent.setup();
    
    render(<[ComponentName] {...defaultProps} disabled on[Event]={mockOn[Event]} />);
    
    const component = screen.getByTestId('[component-name]');
    await user.click(component);
    
    expect(mockOn[Event]).not.toHaveBeenCalled();
  });

  it('renders children correctly', () => {
    const testContent = 'Test content';
    render(
      <[ComponentName] {...defaultProps}>
        {testContent}
      </[ComponentName]>
    );
    
    expect(screen.getByText(testContent)).toBeInTheDocument();
  });

  it('has proper accessibility attributes', () => {
    render(<[ComponentName] {...defaultProps} />);
    const component = screen.getByTestId('[component-name]');
    
    expect(component).toHaveAttribute('role', '[role]');
    expect(component).toHaveAttribute('aria-label', '[aria_label]');
  });

  it('supports keyboard navigation', async () => {
    const mockOn[Event] = jest.fn();
    const user = userEvent.setup();
    
    render(<[ComponentName] {...defaultProps} on[Event]={mockOn[Event]} />);
    
    const component = screen.getByTestId('[component-name]');
    component.focus();
    await user.keyboard('{Enter}');
    
    expect(mockOn[Event]).toHaveBeenCalled();
  });
});
```

### [ComponentName].stories.tsx
```typescript
import type { Meta, StoryObj } from '@storybook/react';
import { [ComponentName] } from './[ComponentName]';
import type { [ComponentName]Props } from './types';

const meta: Meta<typeof [ComponentName]> = {
  title: '[ComponentType]/[ComponentName]',
  component: [ComponentName],
  parameters: {
    layout: 'centered',
  },
  argTypes: {
    [prop1]: {
      control: { type: '[control_type]' },
      description: '[Prop1 description]',
    },
    [prop2]: {
      control: { type: '[control_type]' },
      description: '[Prop2 description]',
    },
    disabled: {
      control: { type: 'boolean' },
      description: 'Disables the component',
    },
  },
  tags: ['autodocs'],
};

export default meta;
type Story = StoryObj<typeof meta>;

// Default story
export const Default: Story = {
  args: {
    [prop1]: '[default_value]',
    [prop2]: '[default_value]',
  },
};

// With custom props
export const WithCustomProps: Story = {
  args: {
    [prop1]: '[custom_value]',
    [prop2]: '[custom_value]',
  },
};

// Disabled state
export const Disabled: Story = {
  args: {
    ...Default.args,
    disabled: true,
  },
};

// With children
export const WithChildren: Story = {
  args: {
    ...Default.args,
    children: 'This is the component content',
  },
};

// Interactive example
export const Interactive: Story = {
  args: {
    ...Default.args,
    on[Event]: (value, event) => {
      console.log('[Event] triggered:', value, event);
    },
  },
};
```

### index.ts
```typescript
export { [ComponentName] } from './[ComponentName]';
export type { [ComponentName]Props, [ComponentName]Ref } from './types';
```

## Usage Examples

### Basic Usage
```tsx
import { [ComponentName] } from '@/components/[componentType]';

function App() {
  return (
    <[ComponentName] 
      [prop1]="value1"
      [prop2]="value2"
      on[Event]="handle[Event]"
    >
      Component content
    </[ComponentName]>
  );
}
```

### Advanced Usage
```tsx
import { [ComponentName], type [ComponentName]Ref } from '@/components/[componentType]';

function AdvancedApp() {
  const componentRef = React.useRef<[ComponentName]Ref>(null);
  
  const handle[Event] = useCallback((value: [ValueType]) => {
    console.log('Component event:', value);
  }, []);
  
  const focusComponent = () => {
    componentRef.current?.focus();
  };
  
  return (
    <div>
      <[ComponentName] 
        ref={componentRef}
        [prop1]="value1"
        [prop2]="value2"
        on[Event]={handle[Event]}
        className="custom-class"
        disabled={false}
      >
        Component content
      </[ComponentName]>
      
      <button onClick={focusComponent}>
        Focus Component
      </button>
    </div>
  );
}
```

## Integration Instructions

1. **Install dependencies**:
   ```bash
   npm install classnames
   # or
   yarn add classnames
   ```

2. **Import and use**:
   ```tsx
   import { [ComponentName] } from '@/components/[componentType]';
   ```

3. **Customize styles**:
   - Modify `[ComponentName].module.css` for visual changes
   - Use CSS custom properties for theming
   - Override styles with utility classes

4. **Testing**:
   - Run tests with: `npm test [ComponentName]`
   - Check Storybook for visual testing: `npm run storybook`

## Next Steps
1. [ ] Customize component props based on specific requirements
2. [ ] Add additional features as needed
3. [ ] Update styles to match design system
4. [ ] Add more test cases for edge cases
5. [ ] Update Storybook stories for better documentation
6. [ ] Consider adding TypeScript generic types if needed
```

Focus on creating a production-ready, accessible, and well-tested component that follows React/Vue best practices.